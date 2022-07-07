trigger Task2 on Opportunity (after update) {
    if(trigger.isAfter)
    {
        if(trigger.isUpdate)
        {
            Task2Handler.updateAmount(Trigger.new);
        }
    }
}