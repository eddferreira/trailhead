public class AccessAccount {
	
    public static void createAccount(String nameAccount){
        
        Account Cc = new Account();
        Cc.Name = nameAccount;
        
        insert Cc;        
    }
    
    public static void updateAccount(Id IdAccount, String nameCc){
     
        Account Cc = [select id from account where id = :IdAccount];
        
        if(!String.isBlank(Cc.Id)){
            Cc.Name = nameCc;
            
            update Cc;
        }
    }
    
    public static void deleteAccunt(Id IdAccount){

        Account Cc = [select id from account where id = :IdAccount];
        
        if(!String.isBlank(Cc.Id)){
           delete Cc; 
        }   
    }
    
    public static String getAccount(Id IdAccount){
        Account Cc = [select id, Name from Account where id = :IdAccount];
        
        return Cc.Name;
    }
    
    
}