public class AccountInsert {

    public static void AccInsert()
    {
        list <Account> Accs = new list<Account>();
        Account Acc1 = new Account(Name = 'Test Industry3',
                        Active__c = 'Yes',
                        SLAExpirationDate__c = date.parse('02/21/2018'),
                        SLASerialNumber__c = '123457',
                        SLA__c = 'Gold');
        Account Acc2 = new Account(Name = 'Test Industry4',
                        Active__c = 'Yes',
                        Industry = 'Finance',           
                        SLAExpirationDate__c = date.parse('02/21/2018'),
                        SLASerialNumber__c = '123458',
                        SLA__c = 'Silver');
        
        Accs.add(Acc1);
        Accs.add(Acc2);
        try{
        	Insert Accs;    
        }
        catch (DMLException e)
        {
            for(Account Acc: Accs)
            {
                String emailid = 'a.vinilkumar@gmail.com';
              	Acc.addError(e.getMessage());
                Messaging.SingleEmailMessage mail=new Messaging.SingleEmailMessage();
     			String[] toAddresses = new String[] {emailid};
     			mail.setToAddresses(toAddresses);
     			//mail.setReplyTo('support@id.com');
     			mail.setSenderDisplayName('Apex error message');
     			mail.setSubject('Error from Org : ' + UserInfo.getOrganizationName());
     			mail.setPlainTextBody(e.getMessage());
                mail.setPlainTextBody('Account Name: ' + Acc.Name);
     			Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
            }
            
        }
    }
}