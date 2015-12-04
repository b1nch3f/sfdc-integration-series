global class MyWebService {
    webService static List<Account> makeContact() {
        return [select name from account];
    }
}