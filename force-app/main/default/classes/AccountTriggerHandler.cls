/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 10-16-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class AccountTriggerHandler {

    public static void beforeUpdate(List<Account> accList){
        if(System.IsBatch() == false && System.isFuture() == false){ 
            // make your future call here 
            AccountProcessor.countContacts(AccountProcessor.getIDList(accList));
        }
        // do nothing
    }
}
