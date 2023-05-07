trigger CasaTrigger on Casa__c (before insert, before update) {
    CasaTriggerHandler.alteraCampo(Trigger.new);
}