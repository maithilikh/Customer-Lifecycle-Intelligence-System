@isTest
public class OpportunityPredictionTest {

    @isTest
    static void testOpportunityPrediction() {

        Account acc = new Account(Name = 'Test Acc');
        insert acc;

        Opportunity opp = new Opportunity(
            Name = 'Test Opp',
            AccountId = acc.Id,
            StageName = 'Proposal/Price Quote',
            CloseDate = Date.today().addDays(10),
            Amount = 150000
        );

        insert opp;

        Opportunity result = [SELECT Predicted_Close_Probability__c FROM Opportunity WHERE Id = :opp.Id];

        System.assert(result.Predicted_Close_Probability__c > 0);
    }
}
