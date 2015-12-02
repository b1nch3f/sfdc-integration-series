@isTest
private class REST_AccountService_V1_Test {
    
    static testMethod void testDoGet() {
        setupTestData();
        
        Test.startTest();
        // Set up the RestContext object
        System.RestContext.request = new RestRequest();
        System.RestContext.response = new RestResponse();
        RestContext.request.requestURI = '/services/apexrest/v1/accounts/';  
        RestContext.request.httpMethod = 'GET';
        
        REST_AccountService_V1.AccountWrapper results = new REST_AccountService_V1.AccountWrapper();
        results = REST_AccountService_V1.doGet();
        system.assertNotEquals(null, results.acctList);
        system.assertEquals('Success', results.message);
        Test.stopTest();

    }
    
    private static void setupTestData() {
        List<Account> accounts = new List<Account>();
        accounts.add(new Account(Name='Account 1', Phone='(111) 222-3344', Website='www.account1.com'));
        accounts.add(new Account(Name='Account 2', Phone='(222) 333-4455', Website='www.account1.com'));
        accounts.add(new Account(Name='Account 3', Phone='(333) 444-5566', Website='www.account1.com'));
        accounts.add(new Account(Name='Account 4', Phone='(444) 555-6677', Website='www.account1.com'));
        accounts.add(new Account(Name='Account 5', Phone='(555) 666-7788', Website='www.account1.com'));
        insert accounts;
    }
}