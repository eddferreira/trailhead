trigger TriggerContact on Contact (before insert) {
    
   TriggerContactHandler.createContactAccount(Trigger.new);
    
}