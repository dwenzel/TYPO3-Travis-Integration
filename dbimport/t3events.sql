ALTER TABLE  `sys_category` ADD  `import_id` VARCHAR( 100 ) NOT NULL AFTER  `uid` ,



ADD  `tx_phpunit_is_dummy_record` VARCHAR( 100 ) NOT NULL AFTER  `import_id`,
ADD  `import_source` VARCHAR( 100 ) NOT NULL AFTER  `import_id` ;
