public class AccountHelper{
 Static Map<id, Contact> AccContactMap = new Map<id,contact>();
   Public static void HandleAfterInsert(list<Account> newRecords)
   {
      // createContact(newRecords);
   }
    
   Public static void HandleBeforeInsert(list<Account> newRecords,  list<Account> OldRecords)
   {
		for(Account AccOld: OldRecords)
        {
            if(AccOld.Account_created__c == true)
            {
                
            }
                
        }
   }
   
    public static void CreateContact(list <Account> newRecords)
   {
        Map<String, SObject> recordTypesByName = getRecordTypes();
       
        list<contact> cons = new list<contact>();
        Contact con = new Contact();
        for (Account newRecord: newRecords) 
        {
             if (newRecord.RecordTypeId == recordTypesByName.get('Employer').Id) 
             {   
                String str = NewRecord.Contact_Name__c;  
                 String[] Name = str.split(' '); 
             
                 con.FirstName = Name[0];
                 con.LastName  = Name[1];     
                 con.email     = NewRecord.Contact_email__c; 
                 con.phone     = NewRecord.Contact_phone__c;
                 con.Accountid = NewRecord.id;
                 cons.add(con);                                                                                    
             }          
        }
        insert cons;
        
        for(Contact c : cons)
        {
           // System.debug('Account Id: ' + con.Id);
            AccContactMap.put(c.accountId, c) ;
        }
        createPayProfile(newRecords);
   }

   public static void CreatePayprofile(list <Account> newRecords)
   {
        Map<String, SObject> recordTypesByName = getRecordTypes();
        list<comment__c> comm = new list<comment__c>();
        Comment__c com = new comment__c();
        for (Account newRecord: newRecords) 
        {
             if (newRecord.RecordTypeId == recordTypesByName.get('Employer').Id) 
             {
              // id conid = [select id from contact where Lastname = 'Tata'].id; 
               com.Account__c = newRecord.id;
               com.contact__c = accContactmap.get(newRecord.id).id; 
                          
               comm.add(com);                                                                               
             }        
        }
        insert comm;     
   }
   
   private static Map<String, SObject> getRecordTypes() 
   {
        List<RecordType> recordTypes = [SELECT Id, Name FROM RecordType];
        Map<String, SObject> recordTypesByName = getSimpleStringMappedObjects(recordTypes, 'Name');
        return recordTypesByName;
   }
   
   public static Map<String, SObject> getSimpleStringMappedObjects(List<Sobject> objects, String fieldName) 
   {
        
        Map<String, SObject> mappedObjs = new Map<String, SObject>();
        
        if (objects != null && objects.size() != 0) 
        {
        
            for (SObject obj: objects) 
            {
                mappedObjs.put((String) obj.get(fieldName), obj);                
            }
            
        }
        
        return mappedObjs;
        
   }
    public static void Handlebeforeupdate(list <Account> newRecords, list <Account> oldRecords)
    {
        for(Account acc: newrecords)
        {
        	list<Contact> cons = [select id from Contact where Accountid =: acc.id  ];    
            system.debug('Succesfully triggered when a related record is inserted');
        }
        
    }
}