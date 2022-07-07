//"Create a new object - Employee , field  (name(required),age,address,dob (date of birth)(required),totalexperience,email(required),role)
//Calculate the age when date of birth is filled by employee"

trigger emplAge on Employee__c (before insert, before update) 
{
    for(Employee__c e : trigger.new)
    {
        integer[] month = new list <integer>{31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
        	
            system.debug('date' +e.Date_of_Birth__c);  		//15-12-2012
            Date present_date = system.today();
            Integer present_day = present_date.day(); 		//21
            Integer present_month = present_date.month(); 	//06
            Integer present_year = present_date.year(); 	//2022
        
            Date birth_date = e.Date_of_Birth__c;
            Integer birth_day = birth_date.day(); 			//06
            Integer birth_month = birth_date.month(); 		//07
            Integer birth_year = birth_date.year(); 		//2012
        
        if(birth_day > present_Day)
        {
            present_day = present_day + month[birth_month - 1];
            present_month = present_month - 1;
        }
        
        if(birth_month > present_month)
        {
            present_year = present_year - 1;
            present_month = present_month + 12;
        }
        
        integer final_day = present_day - birth_day;
        integer final_month = present_month - birth_month;
        integer final_year = present_year - birth_year;
        
        e.Age__c = '' +final_year;
        
        if(e.Date_of_Birth__c > System.today())
        {
			e.Date_of_Birth__c.addError('Error : Birth Day Date Cant be Future Date');
		}
	}
}