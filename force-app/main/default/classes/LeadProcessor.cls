public class LeadProcessor implements Database.Batchable<sObject> 
{
	public Integer recordCount = 0;
    
    public Database.QueryLocator start(Database.BatchableContext dbc)
    {
     	return Database.getQueryLocator([SELECT Id, Name FROM Lead]);        
	}
    
    public void execute(Database.BatchableContext dbc, List<Lead> leads) 
    {
        for (lead l : leads)
        {
            l.LeadSource = 'Dreamforce';
        }
        update leads;
        recordCount = recordCount + leads.size();
    }
    
    public void finish (Database.BatchableContext dbc)
    {
        System.debug('Total recors processed' + recordCount);
    }
}