ALTER TABLE  `sys_category` ADD  `import_id` VARCHAR( 100 ) NOT NULL AFTER  `uid` ,
ADD  `import_source` VARCHAR( 100 ) NOT NULL AFTER  `import_id` ;
