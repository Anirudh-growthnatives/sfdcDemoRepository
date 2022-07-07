@istest
private class TestVerifyDate {
    static testMethod void method1crit1() {
        Date startDate = Date.parse('06/02/22');
        Date endDate = Date.parse('06/23/22');
        Date method1res1 = VerifyDate.CheckDates(startDate, endDate);
        System.assertEquals(endDate, method1res1);
    }
   static testMethod void method2crit2() {
        Date startDate = Date.parse('06/02/22');
        Date endDate = Date.parse('07/12/22');
        Date method2res2 = VerifyDate.CheckDates(startDate, endDate);
    }
}