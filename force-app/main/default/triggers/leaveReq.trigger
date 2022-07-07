trigger leaveReq on Leave__c (before insert) {
    for(leave__c l : Trigger.new){
        if(l.Name != null && l.Leave_Reason__c != null){
            l.Status__c = 'Requested';
            l.Date_From__c = system.today();
        }
    }

}