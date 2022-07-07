trigger campaignMems on Campaign (before insert, before update, after update) 
{
     if(Trigger.isBefore)
     {
         if(Trigger.isInsert)
         {
             campaignMemsTriggerHandler.onBeforeInsert(Trigger.New);
         }
     }
     if(Trigger.isupdate)
     {
         if(Trigger.isInsert)
         {
             campaignMemsTriggerHandler.onBeforeUpdate(Trigger.New);
         }
     }
     if(Trigger.isAfter)
     {
         if(Trigger.isUpdate)
         {
             campaignMemsTriggerHandler.onAfterUpdate(Trigger.New, Trigger.OldMap);
         }
     }


}