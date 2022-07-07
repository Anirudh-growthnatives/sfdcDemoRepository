//Prefix first name with Dr when new lead is created or updated

trigger leadDr on Lead (before insert, before update) {
    
    if(trigger.isInsert && trigger.isbefore) {
        
        for(Lead l : Trigger.new){
            system.debug('Trigger New List:' + Trigger.New);
            l.FirstName = 'Dr' + l.FirstName ;
    }        
   }   
  }