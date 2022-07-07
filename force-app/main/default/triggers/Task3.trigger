trigger Task3 on Opportunity (after update) {
    if(trigger.isAfter)
    {
        if(trigger.isUpdate)
        {
            Task3TriggerHandler.updateLicence(Trigger.new);
        }
    }
}