@isTest
public class BatchTest {

    @isTest
    static void testBatchExecution() {

        Account acc = new Account(Name = 'Batch');
        insert acc;

        Product_Usage__c usage = new Product_Usage__c(
            Account__c = acc.Id,
            Feature_Adoption_Score__c = 50,
            Customer_Satisfaction__c = 60
        );

        insert usage;

        Test.startTest();
        Database.executeBatch(new ChurnRiskBatch(), 1);
        Test.stopTest();

        List<Customer_Health_Snapshot__c> results = [
            SELECT Id FROM Customer_Health_Snapshot__c WHERE Account__c = :acc.Id
        ];

        System.assert(results.size() > 0);
    }
}
