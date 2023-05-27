public with sharing class ContactTriggerHandler extends TriggerHandler{
    private ContactBO bo = ContactBO.getInstance();
    public ContactTriggerHandler(){}

    public override void beforeInsert(){
        bo.PhoneMask(trigger.new);
    }
    
    public override void beforeUpdate(){
        bo.PhoneMask(trigger.new);
    }
}