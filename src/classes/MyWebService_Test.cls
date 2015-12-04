@isTest
private class MyWebService_Test {
  
  @isTest
  private static void makeContact_Test() {
    List<Account> accts = MyWebService.makeContact();
    System.assert(accts != null);
  }
}