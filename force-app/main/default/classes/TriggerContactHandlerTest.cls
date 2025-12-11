@isTest
public class TriggerContactHandlerTest {
    
    @testSetup
    static void setupData() {
        // Criando contatos de teste
        List<Contact> contatos = new List<Contact>();
        contatos.add(new Contact(FirstName = 'João', LastName = 'Silva'));
        contatos.add(new Contact(FirstName = 'Maria', LastName = 'Oliveira'));
        insert contatos;
    }
    
    @isTest
    static void testCreateContactAccount() {
        // Buscar contatos criados no testSetup
        List<Contact> contatos = [SELECT Id, FirstName, LastName, AccountId FROM Contact];
        
        // Executar o método da classe
        Test.startTest();
        TriggerContactHandler.createContactAccount(contatos);
        Test.stopTest();
        
        // Atualizar os contatos para refletir mudanças
        update contatos;
        
        // Validar se os contatos foram associados a uma conta
        contatos = [SELECT Id, FirstName, LastName, AccountId FROM Contact];
        
        for(Contact c : contatos) {
            System.assertNotEquals(null, c.AccountId, 'O contato deve estar associado a uma conta.');
            
            Account acc = [SELECT Id, Name FROM Account WHERE Id = :c.AccountId];
            String expectedName = c.FirstName + ' ' + c.LastName;
            System.assertEquals(expectedName, acc.Name, 'O nome da conta deve ser igual ao nome do contato.');
        }
    }
}