public class HttpCalloutSample {
    //Pass in the endpoint to be used 
    public static String getContent(String city){ 
        
        Http h=new Http(); 
        //Instantiate a new HTTP request,specify the method (GET) as well as the endpoint 
        HttpRequest req= new HttpRequest(); 

        //get apiKey via custom setting
        String apiKey = Openweathermap__c.getInstance('APIKEY').APIKey__c;
        
        //get endpoint url via named credential
        req.setEndpoint('callout:openweathermap'+'?q='+city+'&appid='+apiKey); 
        req.setMethod('GET'); 
        
        //Send the request, andreturn a response 
        HttpResponse res = h.send(req); 
        return res.getBody(); 
    }
}