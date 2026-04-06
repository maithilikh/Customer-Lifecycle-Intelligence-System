@isTest
public class LifecycleServiceTest {

    @isTest
    static void testLifecycleCreation() {

        Account acc = new Account(Name = 'Lifecycle');
        insert acc;

        Lifecycle_Intelligence__c li =
            LifecycleIntelligenceService.buildRecord(
                acc.Id,
                80,
                70,
                60,
                50
            );

        insert li;

        Lifecycle_Intelligence__c result = [
            SELECT Category__c FROM Lifecycle_Intelligence__c WHERE Id = :li.Id
        ];

        System.assertNotEquals(null, result.Category__c);
    }
}
