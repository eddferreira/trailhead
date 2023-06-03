trigger OpportunityTrigger on Opportunity (before update) {
    OpportunityTriggerHandler.stageOpportunity(trigger.new);
}