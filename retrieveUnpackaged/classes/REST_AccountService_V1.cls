/****************************************************************************************************
 * Description - Sample Apex REST service with GET method
 * Author - Sangram Kesari Ray
 ****************************************************************************************************/

@RestResource(urlMapping='/v1/accounts/*')
global with sharing class REST_AccountService_V1 {
    
    @HttpGet
    global static AccountWrapper doGet() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;

        AccountWrapper response = new AccountWrapper();
        
        try {
            response.acctList = [select id, name from account];
            response.status = 'Success';
        }
        catch(Exception exc) {
            res.StatusCode = 500;
            response.acctList = null;
            response.status = 'Error';
            response.message = 'Your request failed with the following error: ' + exc.getMessage();
        }
        
        return response;
    }
    
    global class AccountWrapper {
        public List<Account> acctList;
        public String status;
        public String message;
        
        public AccountWrapper(){
            acctList = new List<Account>();
        }
    }
}