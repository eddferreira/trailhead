trigger AccountTrigger on Account (before insert, before delete) {
    if (Trigger.isInsert) {
        AccountTriggerHandler.getNumeroDocumento(Trigger.new);
    }else if(trigger.isDelete){
        AccountTriggerHandler.evitarExclusaoDeConta(trigger.old);
    }
}