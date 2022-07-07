//"Create a field on Account- Total Contact (Number type).
//Update the Total Contact field with total count of contact on the account."

trigger contactCnt on Contact (after insert, after update, after delete) {

    List<Account> accList = new List<Account>();
        Set<Id> setAccIds = new Set<Id>();
    
    if(trigger.isInsert){
        if(trigger.isAfter){
            for(Contact con : trigger.new){
                if(con.AccountId != null){
                    setAccIds.add(con.AccountId);
                }
            }
        }
    }
        if(trigger.isUpdate  || trigger.isDelete){
        if(trigger.isAfter){
            for(Contact con : trigger.old){
                if(con.AccountId != null){
                    setAccIds.add(con.AccountId);
                }
            }
        }
    }
    
    for (Account acc :[Select id,Total_Contacts__c,(Select Id from Contacts) from Account where Id in : setAccIds]){
        Account acc2 = new Account();
        acc2.Id = acc.Id;
        acc2.Total_Contacts__c = acc.Contacts.size();
        accList.add(acc2);
    }
    update accList;
}