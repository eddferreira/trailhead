trigger ValTotal on Transacao__c (after insert, after update){
        ValTotalTriggerHandler.ValTot(Trigger.new);
}