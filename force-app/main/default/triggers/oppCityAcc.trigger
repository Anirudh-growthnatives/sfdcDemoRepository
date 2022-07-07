//Write a trigger to update a field(city) in opportunity when same field(city) is updated in account
trigger oppCityAcc on Account (after insert, after update) {
    Set<id> Ids = new Set<id>();
    
    for(Account a: Trigger.New){
        Ids.add(a.Id);
        }
    
    
    List<Opportunity> oppList = new List<Opportunity>([select ID,AccountId from Opportunity where AccountId in: Ids]);
     List<Opportunity> oppList2 = new List<Opportunity>();       
        for(Account a : Trigger.new){
            for(Opportunity opp :oppList){
                opp.city__c = a.City__c;
                oppList2.add(opp);
            }
            }
         if(oppList2.size()>0){
                   Update oppList2;                                       
       }

}