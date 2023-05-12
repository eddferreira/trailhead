@isTest
public class ValTotalTriggerHandlerTest{
    @TestSetup
    static void getData(){
        Product2 produto = new Product2();
        produto.Name = 'mesa';
        produto.IsActive = True;
        produto.Id = '01t8c00000LSeVEAA1';
        insert produto;

        Transacao__c transacao1 = new Transacao__c();
        transacao1.Data_ven__c = Data.today();
        transacao1.Data_pag__c = Data.today();
        transacao1.Prod_ven__c = produto.Id;
        transacao1.Valor__c = 2000.00;
        insert transacao1;

        Transacao__c transacao2 = new Transacao__c();
        transacao2.Data_ven__c = Data.today();
        transacao2.Prod_ven__c = produto.Id;
        transacao2.Valor__c = 3000.00;
        insert transacao2;

    }

    @isTest 
    static void ValTotTest(){

    }
}