@RestResource(urlMapping='/AccountDetails/*')
global with sharing class AccountDetails {

    @HttpGet
    global static Account doGet() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String accountId1 = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        String[] str = accountid1.split('&');  
        String accountId = str[0];
        String sla = str[1]; 
        System.debug('Account Id:'+accountId);
        system.debug('SLA' + sla);
        Account result = [SELECT Id, Name, Phone, Website FROM Account WHERE Id = :accountId];
        return result;
    }
}