public class LifecycleIntelligenceService {

    public static Lifecycle_Intelligence__c buildRecord(
        Id accountId,
        Decimal leadScore,
        Decimal oppScore,
        Decimal usageScore,
        Decimal satisfaction
    ) {

        Lifecycle_Intelligence__c li = new Lifecycle_Intelligence__c();

        li.Account__c = accountId;
        li.Lead_Score__c = leadScore;
        li.Opportunity_Score__c = oppScore;
        li.Usage_Score__c = usageScore;
        li.Customer_Satisfaction__c = satisfaction;
        li.Analysis_Date__c = Date.today();

        Decimal total =
            (leadScore * 0.25) +
            (oppScore * 0.25) +
            (usageScore * 0.25) +
            (satisfaction * 0.25);

        if (total >= 80)
            li.Category__c = 'High Value';
        else if (total >= 60)
            li.Category__c = 'Growth';
        else if (total >= 40)
            li.Category__c = 'Risk';
        else
            li.Category__c = 'High Churn Risk';

        return li;
    }
}
