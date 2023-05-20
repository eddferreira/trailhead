@IsTest
public class CasaTriggerHandlerTest {
    @TestSetup
    static void getData(){
        Casa__c casa = new Casa__c();
        casa.Quant_Quartos__c = 2;
        casa.Valor_Imovel__c = 200000;
        casa.Casa_Completa__c = 'sim';

        insert Casa;
    }

    @isTest
    Static void alteraCampoTest() {
        List<Casa__c> casa = [select Casa_Completa__c from Casa__c];

        Test.startTest();
            CasaTriggerHandler.alteraCampo(casa);
        Test.stopTest();
    }
}