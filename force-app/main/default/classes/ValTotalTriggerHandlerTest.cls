@isTest
public class ValTotalTriggerHandlerTest{
    @TestSetup
    static void getData(){
        Product2 produto = new Product2();
        produto.Name = 'mesa';
        produto.IsActive = True;
        insert produto;

        Transacao__c transacao = new Transacao__c();
        transacao.Data_ven__c = Date.today();
        transacao.Data_pag__c = Date.today();
        transacao.Prod_ven__c = produto.Id;
        transacao.Valor__c = 2000.00;
        insert transacao;

    }

    @isTest
    static void ValTotTest(){
        List<Transacao__c> transacao = [select Valor__c, Prod_ven__c, Data_ven__c, Data_pag__c  from Transacao__c];

        Test.startTest();
            ValTotalTriggerHandler.ValTot(transacao);
        Test.stopTest();

    }

}