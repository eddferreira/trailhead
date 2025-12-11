public class AccessContact {
	
    // create Contact
    public static void createContact(String firstNameContact, String lastNameContact){
        
        Contact currentContact = new Contact();
        currentContact.FirstName = firstNameContact;
        currentContact.LastName = lastNameContact;
        
        insert currentContact;        
    }
    
    // update Contact 
    public static void updateContact(Id IdContact, String lastNameContact){
     
        Contact currentContact = [select id from Contact where id = :IdContact];
        
        try{
            if(currentContact.Id != null){
            currentContact.LastName = lastNameContact;
            
            update currentContact;
        	}
        }catch (Exception e){
            System.debug('Erro ao atualizar o registro' + e.getMessage());
        }     
    }
    
    // delete Contact
    public static void deleteContact(Id IdContact){

        Contact currentContact = [select id from Contact where id = :IdContact];
        
        try{
            if(currentContact.Id != null){
           delete currentContact; 
        	}
        }catch(Exception e){
            System.debug('Erro ao excluir o registro' + e.getMessage());
        }        
    }
    
    // get Contact 
    public static Contact getContact(Id IdContact){
        Contact currentContact = [select id, FirstName, LastName from Contact where id = :IdContact];
        
        try{
            if(currentContact.Id != null){
               return currentContact; 
            }   
            return null;
            
        }catch(Exception e){
            System.debug('Registro não encontrado' + e.getMessage());
            return null;
        }   
    }   
}