@isTest
public class AccessAccountTest {
    
    @isTest
    static void testCreateAccount() {
        Test.startTest();
        AccessAccount.createAccount('Conta Teste');
        Test.stopTest();
        
        Account acc = [SELECT Id, Name FROM Account WHERE Name = 'Conta Teste' LIMIT 1];
        System.assertEquals('Conta Teste', acc.Name, 'O nome da conta deve ser igual ao informado.');
    }
    
    @isTest
    static void testUpdateAccount() {
        // Cria conta inicial
        Account acc = new Account(Name = 'Conta Original');
        insert acc;
        
        Test.startTest();
        AccessAccount.updateAccount(acc.Id, 'Conta Atualizada');
        Test.stopTest();
        
        Account updatedAcc = [SELECT Id, Name FROM Account WHERE Id = :acc.Id];
        System.assertEquals('Conta Atualizada', updatedAcc.Name, 'O nome da conta deve ter sido atualizado.');
    }
    
    @isTest
    static void testDeleteAccount() {
        // Cria conta inicial
        Account acc = new Account(Name = 'Conta para Deletar');
        insert acc;
        
        Test.startTest();
        AccessAccount.deleteAccount(acc.Id);
        Test.stopTest();
        
        // Verifica se foi realmente deletado
        Integer countAcc = [SELECT COUNT() FROM Account WHERE Id = :acc.Id];
        System.assertEquals(0, countAcc, 'A conta deveria ter sido excluída.');
    }
    
    @isTest
    static void testGetAccount() {
        // Cria conta inicial
        Account acc = new Account(Name = 'Conta para Buscar');
        insert acc;
        
        Test.startTest();
        String nomeConta = AccessAccount.getAccount(acc.Id);
        Test.stopTest();
        
        System.assertEquals('Conta para Buscar', nomeConta, 'O método deve retornar o nome correto da conta.');
    }
}