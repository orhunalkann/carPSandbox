Account acc = [SELECT Id, Name, OwnerId, CreatedBy.Name From Account WHERE Id = '0014x00001hKBhWAAW'];


//prepare a map of data
Map<String, Object> isoMap = new Map<String, Object>();
isoMap.put('AccountId',acc.Id);
isoMap.put('AccountName',acc.Name);
isoMap.put('AccOwnerId',acc.OwnerId);
isoMap.put('CreatedByName',acc.CreatedBy.Name);


//start flow interview
Flow.Interview flow = new Flow.Interview.Account_Autolaunched_FLow(isoMap);
flow.start();