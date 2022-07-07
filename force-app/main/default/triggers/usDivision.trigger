trigger usDivision on Opportunity (before insert, before update) {
    for(Opportunity o : Trigger.new){
        if(o.US_Divison__c == true){
            o.Partnership_Source__c = 'US Divison';
}
}


}