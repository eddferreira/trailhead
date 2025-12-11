@isTest
public class AccessContactTest {
    
    // Método utilitário para criar um contato de teste
    private static Contact createTestContact() {
        Contact c = new Contact(
            FirstName = 'Teste',
            LastName = 'Contato'
        );
        insert c;
        return c;
    }
    
    @isTest
    static void testCreateContact() {
        Test.startTest();
        AccessContact.createContact('João', 'Silva');
        Test.stopTest();
        
        // Verifica se o contato foi criado
        Contact c = [SELECT Id, FirstName, LastName FROM Contact WHERE LastName = 'Silva' LIMIT 1];
        System.assertEquals('João', c.FirstName, 'O primeiro nome deve ser João');
        System.assertEquals('Silva', c.LastName, 'O sobrenome deve ser Silva');
    }
    
    @isTest
    static void testUpdateContact() {
        Contact c = createTestContact();
        
        Test.startTest();
        AccessContact.updateContact(c.Id, 'Souza');
        Test.stopTest();
        
        // Verifica se o sobrenome foi atualizado
        Contact updated = [SELECT Id, LastName FROM Contact WHERE Id = :c.Id];
        System.assertEquals('Souza', updated.LastName, 'O sobrenome deve ser Souza');
    }
    
    @isTest
    static void testDeleteContact() {
        Contact c = createTestContact();
        
        Test.startTest();
        AccessContact.deleteContact(c.Id);
        Test.stopTest();
        
        // Verifica se o contato foi excluído
        Integer countContacts = [SELECT COUNT() FROM Contact WHERE Id = :c.Id];
        System.assertEquals(0, countContacts, 'O contato deve ter sido excluído');
    }
    
    @isTest
    static void testGetContact() {
        Contact c = createTestContact();
        
        Test.startTest();
        Contact result = AccessContact.getContact(c.Id);
        Test.stopTest();
        
        System.assertNotEquals(null, result, 'O contato deve ser retornado');
        System.assertEquals(c.Id, result.Id, 'O Id deve ser igual ao do contato criado');
    }
}