//Whenever phone field is updated in account then the name field should get update with name + phone number in accounts
trigger phAccUpd on Account (before update) {
    for(Account a : Trigger.new){
        if(a.Phone != Trigger.oldMap.get(a.Id).Phone){
            system.debug('Trigger.oldMap contains:' +Trigger.oldMap);
            a.name = a.name + a.Phone;
        }
        
    }

}