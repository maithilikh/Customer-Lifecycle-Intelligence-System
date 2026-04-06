global class WeeklyChurnScheduler implements Schedulable {

    global void execute(SchedulableContext sc) {

        Database.executeBatch(new ChurnRiskBatch(), 200);
    }
}
