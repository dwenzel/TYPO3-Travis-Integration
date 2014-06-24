#!/bin/bash
export phpConfigFile=`php --ini | grep "Loaded Configuration" | sed -e "s|.*:\s*||"`

function addOptionToPhpConfig() {
	if grep -q "$1" $phpConfigFile
	then
		echo "Option $1 already added"
	else
		echo "$1" >> $phpConfigFile
	fi
}

function addModuleToPhpConfig() {
	if grep -q "$1.so" $phpConfigFile
	then
		echo "Module $1 already added"
	else
		addOptionToPhpConfig "extension=$1.so"
	fi
}

function installPhpModule() {
	case "$1" in
		-y)
			printf "no\n" | pecl install $2 > /dev/null
			shift
		;;
		redis)
			installRedis > /dev/null
		;;
		*)
			pecl install $1 > /dev/null
		;;
	esac

	addModuleToPhpConfig $1

	if [[ "$1" == "apc" ]]
	then
		addOptionToPhpConfig "apc.enable_cli=1"
		addOptionToPhpConfig "apc.slam_defense=0"
	fi
}

function installRedis() {
	_pwd=$PWD
	mkdir build-environment/phpredis-build
	cd build-environment/phpredis-build
	git clone --depth 1 git://github.com/nicolasff/phpredis.git
	cd phpredis
	phpize
	./configure
	make
	sudo make install
	cd $_pwd
}

function phpLint {
	for file in `find . -name \*.php`
	do
		echo -en "\r\033[KChecking: $file"
		if ! php -l $file > /dev/null
		then
			echo -en "\r\033[K"
			echo -e "\e[00;31mSyntax errors detected in file: $file\e[00m"
			ERR=1
			[ -z "$1" ] && break
		fi
	done

	echo -e "\r\033[K"

	if [ -n "$ERR" ]
	then
		return 99
	fi

	return 0
}

function phpCodeSniff {
	# install alpha version of typo3/TYPO3CMS
	pear channel-discover pear.typo3.org
	pear config-set preferred_state devel
	pear install typo3/TYPO3CMS
	pear config-set preferred_state stable
	# force install of PHP_CodeSniffer version 1.5.3
	pear channel-update pear.php.net
	pear install -f PHP_CodeSniffer-1.5.3
	phpenv rehash
	phpcs -i
	phpcs -n --extensions=php --report=summary --report-full=$PWD/build/artifacts/log/phpcs_report.txt --ignore=ext_emconf.php --standard=TYPO3CMS $PWD/typo3conf/ext/ajaxmap/
}
