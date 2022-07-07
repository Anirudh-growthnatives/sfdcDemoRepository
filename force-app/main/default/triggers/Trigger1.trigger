trigger Trigger1 on Account (before insert,before update) 
    {
        for (Account acc: Trigger.new)
        {
            if(acc.type == 'Prospect')
                acc.ischanged__c = true;
                }
    }