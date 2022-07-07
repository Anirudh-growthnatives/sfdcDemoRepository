public class campaignMemsTriggerHandler 
{
    public static void onBeforeInsert(List<Campaign> newList)
    {
        campaignMemsTriggerHelper.campaignErrors(newList);
    }
     public static void onBeforeUpdate(List<Campaign> newList)
    {
        campaignMemsTriggerHelper.campaignErrors(newList);
    }
    public static void onAfterUpdate(List<Campaign> newList, Map<Id,Campaign> oldMap)
    {
        campaignMemsTriggerHelper.campaignErrors2(newList, oldMap);
    }
    

}