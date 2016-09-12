function onUpdateDatabase()
	print("> Updating database to version 1 (bank balance)")
	db.query("ALTER TABLE `players` ADD `balance` BIGINT UNSIGNED NOT NULL DEFAULT 0")
	return true
end
