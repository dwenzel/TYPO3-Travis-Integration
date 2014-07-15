CREATE TABLE cf_cache_hash (
	id int(11) unsigned NOT NULL auto_increment,
	identifier varchar(250) DEFAULT '' NOT NULL,
	expires int(11) unsigned DEFAULT '0' NOT NULL,
	content mediumblob,
	PRIMARY KEY (id),
	KEY cache_id (identifier,expires)
) ENGINE=InnoDB;

CREATE TABLE cf_cache_hash_tags (
	id int(11) unsigned NOT NULL auto_increment,
	identifier varchar(250) DEFAULT '' NOT NULL,
	tag varchar(250) DEFAULT '' NOT NULL,
	PRIMARY KEY (id),
	KEY cache_id (identifier),
	KEY cache_tag (tag)
) ENGINE=InnoDB;


CREATE TABLE cf_cache_rootline (
	id int(11) unsigned NOT NULL auto_increment,
	identifier varchar(250) DEFAULT '' NOT NULL,
	expires int(11) unsigned DEFAULT '0' NOT NULL,
	content mediumblob,
	PRIMARY KEY (id),
	KEY cache_id (identifier,expires)
) ENGINE=InnoDB;

CREATE TABLE cf_cache_rootline_tags (
	id int(11) unsigned NOT NULL auto_increment,
	identifier varchar(250) DEFAULT '' NOT NULL,
	tag varchar(250) DEFAULT '' NOT NULL,
	PRIMARY KEY (id),
	KEY cache_id (identifier),
	KEY cache_tag (tag)
) ENGINE=InnoDB;


CREATE TABLE cf_extbase_datamapfactory_datamap (
	id int(11) unsigned NOT NULL auto_increment,
	identifier varchar(250) DEFAULT '' NOT NULL,
	expires int(11) unsigned DEFAULT '0' NOT NULL,
	content mediumblob,
	PRIMARY KEY (id),
	KEY cache_id (identifier,expires)
) ENGINE=InnoDB;

CREATE TABLE cf_extbase_datamapfactory_datamap_tags (
	id int(11) unsigned NOT NULL auto_increment,
	identifier varchar(250) DEFAULT '' NOT NULL,
	tag varchar(250) DEFAULT '' NOT NULL,
	PRIMARY KEY (id),
	KEY cache_id (identifier),
	KEY cache_tag (tag)
) ENGINE=InnoDB;


CREATE TABLE cf_extbase_object (
	id int(11) unsigned NOT NULL auto_increment,
	identifier varchar(250) DEFAULT '' NOT NULL,
	expires int(11) unsigned DEFAULT '0' NOT NULL,
	content mediumblob,
	PRIMARY KEY (id),
	KEY cache_id (identifier,expires)
) ENGINE=InnoDB;

CREATE TABLE cf_extbase_object_tags (
	id int(11) unsigned NOT NULL auto_increment,
	identifier varchar(250) DEFAULT '' NOT NULL,
	tag varchar(250) DEFAULT '' NOT NULL,
	PRIMARY KEY (id),
	KEY cache_id (identifier),
	KEY cache_tag (tag)
) ENGINE=InnoDB;


CREATE TABLE cf_extbase_typo3dbbackend_tablecolumns (
	id int(11) unsigned NOT NULL auto_increment,
	identifier varchar(250) DEFAULT '' NOT NULL,
	expires int(11) unsigned DEFAULT '0' NOT NULL,
	content mediumblob,
	PRIMARY KEY (id),
	KEY cache_id (identifier,expires)
) ENGINE=InnoDB;

CREATE TABLE cf_extbase_typo3dbbackend_tablecolumns_tags (
	id int(11) unsigned NOT NULL auto_increment,
	identifier varchar(250) DEFAULT '' NOT NULL,
	tag varchar(250) DEFAULT '' NOT NULL,
	PRIMARY KEY (id),
	KEY cache_id (identifier),
	KEY cache_tag (tag)
) ENGINE=InnoDB;


CREATE TABLE cf_extbase_typo3dbbackend_queries (
	id int(11) unsigned NOT NULL auto_increment,
	identifier varchar(250) DEFAULT '' NOT NULL,
	expires int(11) unsigned DEFAULT '0' NOT NULL,
	content mediumblob,
	PRIMARY KEY (id),
	KEY cache_id (identifier,expires)
) ENGINE=InnoDB;

CREATE TABLE cf_extbase_typo3dbbackend_queries_tags (
	id int(11) unsigned NOT NULL auto_increment,
	identifier varchar(250) DEFAULT '' NOT NULL,
	tag varchar(250) DEFAULT '' NOT NULL,
	PRIMARY KEY (id),
	KEY cache_id (identifier),
	KEY cache_tag (tag)
) ENGINE=InnoDB;
