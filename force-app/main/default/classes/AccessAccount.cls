public class AccessAccount {
	
    // create Account
    public static void createAccount(String nameAccount){
        
        Account currentAccount = new Account();
        currentAccount.Name = nameAccount;
        
        insert currentAccount;        
    }
    
    // update Account 
    public static void updateAccount(Id IdAccount, String nameCc){
     
        Account currentAccount = [select id from account where id = :IdAccount];
        
        try{
            if(currentAccount.Id != null){
            currentAccount.Name = nameCc;
            
            update currentAccount;
        	}
        }catch (Exception e){
            System.debug('Erro ao atualizar o registro' + e.getMessage());
        }     
    }
    
    // delete Account
    public static void deleteAccount(Id IdAccount){

        Account currentAccount = [select id from account where id = :IdAccount];
        
        try{
            if(currentAccount.Id != null){
           delete currentAccount; 
        	}
        }catch(Exception e){
            System.debug('Erro ao excluir o registro' + e.getMessage());
        }        
    }
    
    // get Account 
    public static String getAccount(Id IdAccount){
        Account currentAccount = [select id, Name from Account where id = :IdAccount];
        
        try{
            if(currentAccount.Id != null){
               return currentAccount.Name; 
            }   
            return null;
            
        }catch(Exception e){
            System.debug('Registro não encontrado' + e.getMessage());
            return null;
        }   
    }   
}