AccountsBatch ab = new AccountsBatch();
id batchId = database.executeBatch(ab, 20);
system.debug('batch id ==> ' + batchId);