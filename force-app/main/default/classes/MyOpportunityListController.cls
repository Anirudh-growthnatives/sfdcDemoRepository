public class MyOpportunityListController {
    //Get the list of opportunities based on search value
    @AuraEnabled
    public static List<Opportunity> fetchopportunity(String searchkeyWord) {
   	List<Opportunity> returnlist = new List<Opportunity>();
   
   // If search value is null then return all opps. Else search accordingly
   String searchkey = String.isBlank(searchKeyWord) ? '%%' : searchkeyword + '%';
	
        returnlist = [SELECT Id, Name, AccountId, CloseDate, Amount FROM Opportunity WHERE Name LIKE :searchkey LIMIT 15];
		return returnList;
    }
}