/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 10-16-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class AccountProcessor {
    
    @future
    public static void countContacts(List<ID> recordList){
        List<Account> accList= [SELECT Id, Name FROM Account 
                                  WHERE Id IN :recordList];

        List<Account> accDML = new List<Account>();

        for (Account acc : accList) {

            List<Contact> contactList = retrieveContacts(acc);

            acc.Number_Of_Contacts__c = contactList.size();

            accDML.add(acc);
            
        }
        
        update accDML;
        
    }

    public static List<Contact> retrieveContacts(Account acc){
        List<Contact> retrievedContacts = [SELECT Id, Name FROM Contact WHERE AccountId = :acc.Id];

        return retrievedContacts;

    }

    public static List<ID> getIDList(List<Account> accounts){
        List<ID> accountIDs = new List<ID>();

        for (Account acc : accounts) {

            accountIDs.add(acc.Id);
            
        }

        return accountIDs;
    }

}
