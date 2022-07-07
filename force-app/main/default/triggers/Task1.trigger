trigger Task1 on Account (before insert,before update) 
{
    if(trigger.isBefore)
    {
        if(trigger.isInsert)
        {
            Task1TriggerHandler.isChanged(Trigger.new);
        }
        else if(trigger.isUpdate)
        {
            Task1TriggerHandler.updateIsChanged(Trigger.new, Trigger.oldMap);
        }
    }
}