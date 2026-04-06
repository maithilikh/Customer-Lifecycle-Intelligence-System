global class ChurnRiskBatch implements Database.Batchable<SObject> {

    global Database.QueryLocator start(Database.BatchableContext bc) {

        return Database.getQueryLocator(
            'SELECT Id, Account__c, Feature_Adoption_Score__c, Customer_Satisfaction__c FROM Product_Usage__c'
        );
    }

    global void execute(Database.BatchableContext bc, List<Product_Usage__c> scope) {

        List<Customer_Health_Snapshot__c> snapshots = new List<Customer_Health_Snapshot__c>();

        for (Product_Usage__c p : scope) {

            Decimal usageScore = p.Feature_Adoption_Score__c != null ? p.Feature_Adoption_Score__c : 0;
            Decimal satisfaction = p.Customer_Satisfaction__c != null ? p.Customer_Satisfaction__c : 0;

            Decimal churnRisk = 100 - usageScore;

            Customer_Health_Snapshot__c ch = new Customer_Health_Snapshot__c();
            ch.Account__c = p.Account__c;
            ch.Churn_Risk__c = churnRisk;
            ch.Health_Score__c = (usageScore * 0.6) + (satisfaction * 0.4);
            ch.Usage_Score__c = usageScore;
            ch.Snapshot_Date__c = Date.today();

            snapshots.add(ch);
        }

        if (!snapshots.isEmpty())
            insert snapshots;
    }

    global void finish(Database.BatchableContext bc) {}
}
