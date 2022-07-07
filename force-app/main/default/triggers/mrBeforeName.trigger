trigger mrBeforeName on Account (before insert, before update) 
{
    for(Account acc : Trigger.new)
    {       
        if(!acc.Name.startswith('Mr.'))	//startswith to check before name // endswith to check after name
        {
            acc.Name.addError('Mr. Should Come Before Name');
        }
    }    
}