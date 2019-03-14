public class AccountHandler 
{
    
    Public static  Account insertNewAccount(String accname) 
    {
		integer i;
        Account acc = new Account(name = accname);
		//Database.SaveResult srList = Database.insert(acc, false);
         try{ 
             insert acc; 
             i = 1;
         	}
        catch(DMLException e)
        { 
			i = 0;
            system.debug('A DML exception has occurred: ' + e.getmessage()	); 
            
        }
		
        if(i == 1)
        {
            return acc;
        }
        else{
            return null;
        }
            
    }
}