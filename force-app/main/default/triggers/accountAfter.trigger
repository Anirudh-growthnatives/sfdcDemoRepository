//Create related contact when Account is created
//When Account is created - create a respective contact
trigger accountAfter on Account (after insert) {
    List<Contact> cntList = new List<Contact>();
    for(Account a: Trigger.New){
    //  system.debug('Trigger.New List:' + Trigger.New);
      Contact c = new Contact();
      c.AccountId = a.id;
      c.LastName = a.Name;
      c.Phone = a.Phone;
      cntList.add(c);
    }
    insert cntList;
}