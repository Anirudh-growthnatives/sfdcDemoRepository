trigger cpyBillAdd on Account (before insert, before update) {
    for(Account a : trigger.new){
        if(a.Copy_Billing_Adress__c == true){
            a.ShippingCity = a.BillingCity;
            a.ShippingCountry = a.BillingCountry;
            a.ShippingPostalCode = a.BillingPostalCode;
            a.ShippingState = a.BillingState;
            a.ShippingStreet = a.BillingStreet;
        }
    }
    
}