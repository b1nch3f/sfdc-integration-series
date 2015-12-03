@isTest
public class HttpCalloutSample_Test {
    public static testmethod void testAccountCallout() {
        setTestData();
        
        SingleRequestMock fakeResponse = new SingleRequestMock(200,
                                                               'Complete',
                                                               '[{"name": "Boston"}]',
                                                               null);
        Test.setMock(HttpCalloutMock.class, fakeResponse);
        
        Test.startTest();
        String result = HttpCalloutSample.getContent('Boston');
        System.assertNotEquals(null, result);
        Test.stopTest();
    }
    
    private static void setTestData() {
        Openweathermap__c openWeatherMap = new Openweathermap__c();
        openWeatherMap.Name = 'APIKEY';
        openWeatherMap.APIKey__c = '2de143494c0b295cca9337e1e96b00e0';
        insert openWeatherMap;
    }
}