trigger LeadScoringTrigger on Lead (before insert, before update) {

    for (Lead l : Trigger.new) {

        Integer score = 0;

        if (l.NumberOfEmployees != null && l.NumberOfEmployees > 200)
            score += 30;

        if (l.Industry == 'Technology')
            score += 20;

        if (l.AnnualRevenue != null && l.AnnualRevenue > 100000)
            score += 30;

        if (l.Title != null && l.Title.contains('Manager'))
            score += 20;

        l.Lead_Score__c = score;
    }
}
