@isTest
public class LeadScoringTest {

    @isTest
    static void testLeadScoring() {

        Lead l = new Lead(
            LastName = 'Test',
            Company = 'ABC Corp',
            NumberOfEmployees = 300,
            Industry = 'Technology',
            AnnualRevenue = 200000,
            Title = 'Manager'
        );

        insert l;

        Lead result = [SELECT Lead_Score__c FROM Lead WHERE Id = :l.Id];

        System.assert(result.Lead_Score__c > 0);
    }
}
