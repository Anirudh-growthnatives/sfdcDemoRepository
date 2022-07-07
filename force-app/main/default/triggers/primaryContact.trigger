/*  "Create two field on Account - 1. Old primary Contact (contact lookup), 2. New primary Contact (contact lookup)
1. When the new contact related to account is marked primary, That should be updated to the New primary Contact field on account.
2. Only one contact should be marked primary at a time
3. the old primary marked contact should be updated on the Old primary Contact field on account and should be marked non primary."
*/
trigger primaryContact on Contact (after insert, after update, after delete) 
{
    if(trigger.isAfter) 
    {
        if(trigger.isInsert) 
        {
            Map<Id, Id>  map1 = new Map<Id, Id>();
            Set<Id> set1 = new Set<Id>();
            List<Contact> conList1 = new List<Contact>();
            List<Account> accList1 = new List<Account>();
            
            for(Contact c: trigger.new) 
            {
                set1.add(c.AccountId);
                map1.put(c.Id, c.AccountId);
            }
            System.debug('Updates0>>' + map1);

            Map<Id, Account> accMap = new Map<Id, Account>([Select Id, New_Primary_Contact__c,Old_Primary_Contact__c, (Select Id, Name From Contacts Where Primary_Contact__c = True) From Account Where Id in : set1]);
            System.debug('Update1>>' + accMap);
            for(Account acc : accMap.values()) 
            {
                for(Contact con : acc.Contacts) 
                {
                    if(!map1.containsKey(con.Id)) 
                    {
                        con.Primary_Contact__c = False;
                        conList1.add(con);
                        system.debug('update2>>' + conList1);
                    }
                }
            }
            update conList1;
            
            for(Contact c : trigger.new) 
            {
                if(c.Primary_Contact__c) 
                {
                    Account acc2 = accMap.get(c.AccountId);
                    system.debug('update3>>'+ acc2);
                    if( acc2.New_Primary_Contact__c == Null && acc2.Contacts.size() > 0 )
                    {
                        system.debug('update4>>' +c.Id);
                        acc2.New_Primary_Contact__c = c.Id;
                        accList1.add(acc2);
                        system.debug('update5>>' + acc2);
                    }
                    
                    else if(acc2.New_Primary_Contact__c != Null)
                    {
                        acc2.Old_Primary_Contact__c = acc2.New_Primary_Contact__c;
                        acc2.New_Primary_Contact__c = c.Id;
                        accList1.add(acc2);
                        
                    }
                }
            }
            update accList1;
            system.debug('update6>>' + accList1);
        }
    }
    
    if(trigger.isAfter)
    {
        if(trigger.isUpdate)
        {
            Map<Id, Id> map2 = new Map<Id, Id>();
            Set<Id> set2 = new Set<Id>();
            List<Contact> conList2 = new List<Contact>();
            List<Account> accList2 = new List<Account>();
            
            for(Contact c : trigger.new)
            {
                set2.add(c.AccountId);
                map2.put(c.Id, c.AccountId);
            }
            Map<Id, Account> accMap2 = new Map<Id, Account>([Select Id, New_Primary_Contact__c, Old_Primary_Contact__c, (Select Id, Name From Contacts Where Primary_Contact__c = True) From Account Where Id in : set2]);
            for(Account acc3 : accMap2.values())
            {
                for(Contact con2 : acc3.Contacts)
                {
                    if(!map2.containskey(con2.Id))
                    {
                        con2.Primary_Contact__c = False;
                        conList2.add(con2);
                    }
                }                        
            }
            update conList2;
            
            for(Contact c : trigger.new)
            {
                Account acc4 = accMap2.get(c.AccountId);
                if(acc4.New_Primary_Contact__c != Null && acc4.Contacts.size() > 0)
                {
                    String str = acc4.New_Primary_Contact__c;
                    acc4.Old_Primary_Contact__c = str;
                    acc4.New_Primary_Contact__c = c.Id;
                    
                    accList2.add(acc4);
                }
                
                else if(acc4.New_Primary_Contact__c == Null)
                {
                    acc4.New_Primary_Contact__c = c.Id;
                    accList2.add(acc4);
                }
                else if(c.Primary_Contact__c == False)
                {
                    acc4.New_Primary_Contact__c = Null;
                    accList2.add(acc4);
                }
                
            }
            update accList2;
            
        }
    }
    
  /*   
    if(trigger.isAfter)
    {
        if(trigger.isDelete)
        {
            Map<Id, Id> map3 = new Map<Id, Id>();
            Set<Id> set3 = new Set<Id>();
            List<Contact> conList3 = new List<Contact>();
            List<Account> accList3 = new List<Account>();
            
            for(Contact con : trigger.old)
            {
                map3.put(con.Id, con.AccountId);
                set3.add(con.AccountId);
            }
            
            Map<Id, Account> accMap3 = new Map<Id, Account>([Select Id, New_Primary_Contact__c, Old_Primary_Contact__c, (Select ID, Name From Contacts Where Primary_Contact__c = True) From Account Where Id in : set3]);
            
            for(Contact con : trigger.old)
            {
                Account acc5 = accMap3.get(con.AccountId);
                
                if(acc5.New_Primary_Contact__c != Null && acc5.Contacts.size() > 0)
                {
                    String str = acc5.New_Primary_Contact__c;
                    acc5.Old_Primary_Contact__c = str;
                    acc5.New_Primary_Contact__c = Null;
                    accList3.add(acc5);     
                }
                else if(acc5.New_Primary_Contact__c == Null)
                {
                    acc5.New_Primary_Contact__c = Null;
                    accList3.add(acc5);
                }  
            }
            update accList3;
        }
    }
  */  
}