@isTest
public class HttpCalloutSample_Test {
    
    @isTest
    private static void testCallout() {
        //setup test data
        setTestData();
        
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new SingleRequestMock());
        
        Test.startTest();
        
        // Call method to test.
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        HttpResponse res = HttpCalloutSample.getContent('Boston');
        
        // Verify response received contains fake values
        String contentType = res.getHeader('Content-Type');
        System.assert(contentType == 'application/json');
        String actualValue = res.getBody();
        String expectedValue = '{"foo":"bar"}';
        System.assertEquals(actualValue, expectedValue);
        System.assertEquals(200, res.getStatusCode());
        
        Test.stopTest();
    }
    
    private static void setTestData() {
        Openweathermap__c openWeatherMap = new Openweathermap__c();
        openWeatherMap.Name = 'APIKEY';
        openWeatherMap.APIKey__c = '2de143494c0b295cca9337e1e96b00e0';
        insert openWeatherMap;
    }
}