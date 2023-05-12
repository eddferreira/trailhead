public with sharing class CasaTriggerHandler{
    public static void alteraCampo(List<Casa__c> listCasa){
        for(Casa__c casa : listCasa){
            if(casa.Casa_Completa__c == 'Sim') casa.Garagem__c = 'Sim';        
        }
    }
}