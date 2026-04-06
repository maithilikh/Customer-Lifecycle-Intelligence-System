@isTest
public class SchedulerTest {

    @isTest
    static void testScheduler() {

        Test.startTest();

        System.schedule(
            'Test Job',
            '0 0 0 ? * MON',
            new WeeklyChurnScheduler()
        );

        Test.stopTest();
    }
}
