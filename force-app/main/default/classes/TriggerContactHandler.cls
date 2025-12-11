public class TriggerContactHandler {
    
    public static void createContactAccount(List<Contact> listContact){
        
        for(Contact contato : listContact){
            String nameContact = contato.FirstName + ' ' + contato.LastName;
                
            AccessAccount.createAccount(nameContact);
            Account contactAccount = [select id, name from Account where name = :nameContact];
            Account accountId = AccessAccount.getAccount(contactAccount.Id);
            
            contato.AccountId = accountId.Id;
            
        }
    }
}