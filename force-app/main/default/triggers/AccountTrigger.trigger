/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 10-16-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger AccountTrigger on Account (before update) {
    if (Trigger.isBefore) {
        if (Trigger.isUpdate) {
          AccountTriggerHandler.beforeUpdate(Trigger.new);
        }
        // if (Trigger.isUpdate) {
        //   AccountTriggerHandler.beforeUpdate(Trigger.newMap);
        // }
      }

}