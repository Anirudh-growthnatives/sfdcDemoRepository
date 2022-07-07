//  "Create a field on Account - Closed Amount (Number type) Update the Total amount of close won opportunities on Closed Amount field of Account"
trigger closedAmt2 on Opportunity (after insert, after update, after delete)
{
    if(Trigger.isAfter)
    {
        if(Trigger.isInsert)
        {
            closedAmt2TriggerHandler.onAfterInsert(Trigger.New);
        }
        if(Trigger.isUpdate)
        {
            closedAmt2TriggerHandler.onAfterUpdate(Trigger.New);
        }
        if(Trigger.isDelete)
        {
            closedAmt2TriggerHandler.onAfterDelete(Trigger.old);
        }
    }  
}


/*
trigger closedAmt2 on Opportunity (after insert, after update, after delete)
{
Set<Id> accIdSet = new Set<Id>();

if(trigger.isUpdate || trigger.isInsert)
{
if(trigger.isAfter)
{
for(Opportunity opp : trigger.new)
{
if(opp.AccountId != null && opp.StageName == 'Closed Won' && opp.Amount != null)
{
accIdSet.add(opp.AccountId);
}  
}
}
}

if(trigger.isUpdate || trigger.isDelete)
{
if(trigger.isAfter)
{
for(Opportunity opp : trigger.old)
{
if(opp.AccountId != null && opp.StageName == 'Closed Won' && opp.Amount != null)
{
accIdSet.add(opp.AccountId);
}  
}
}
}
List<Account> accList = new List<Account>();
List<Opportunity> oppList = new List<Opportunity>();
accList = [Select id, Closed_Amount__c from Account where Id in : accIdSet];
oppList = [Select id, Name, Amount from Opportunity where AccountId in : accIdSet];
List<Account> accList2 = new List<Account>();
for(Account acc : accList )
{
integer val = 0;
for(Opportunity opp : oppList)
{
val += integer.valueOf(opp.Amount);   
}
acc.Closed_Amount__c = integer.valueOf(val);
acclist2.add(acc);
}
if(acclist2.size()>0)
{
update accList2;
}

}   */