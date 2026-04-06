trigger OpportunityPrediction on Opportunity (before insert, before update) {

    for (Opportunity o : Trigger.new) {

        Decimal probability = 0;

        if (o.Amount != null && o.Amount > 100000)
            probability += 30;

        if (o.StageName == 'Proposal/Price Quote')
            probability += 40;

        if (o.CloseDate != null && o.CloseDate <= Date.today().addDays(30))
            probability += 30;

        o.Predicted_Close_Probability__c = probability;
    }
}
