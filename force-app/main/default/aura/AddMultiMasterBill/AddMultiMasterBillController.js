({
    doinit: function (component,event,helper){
      $A.enqueueAction(component.get('c.addRow'));
    },
    addRow: function(component, event, helper) {
        //get the account List from component  
        var billList = component.get("v.billList");
        //Add New Account Record
        billList.push({
            'sobjectType': 'clofor_com_cfs__MasterAnkenMeisai__c',
            'clofor_com_cfs__MTariff__c': '',
            'clofor_com_cfs__Suryo__c': '',
            'clofor_com_cfs__Charge_Unit__c': '',
            'clofor_com_cfs__Bikou__c': '', 
            'clofor_com_cfs__Seikyusaki__c': '', 
            'clofor_com_cfs__SellTankaUSD__c': '', 
            'CurrencySelling__c': '', 
            'clofor_com_cfs__TaxInitial__c': '', 
            'clofor_com_cfs__PaymentTo__c': '', 
            'clofor_com_cfs__BuyTankaUSD__c': '', 
            'Currency_Buying__c': '', 
            'clofor_com_cfs__BuyTaxInitial__c': '', 
            
        });
        component.set("v.billList", billList);
        console.log('billList:' + JSON.stringify(billList));

    },
    
    removeRecord: function(component, event, helper) {
        //Get the account list
        var billList = component.get("v.billList");
        //Get the target object
        var selectedItem = event.currentTarget;
        //Get the selected item index
        var index = selectedItem.dataset.record;
        //Remove single record from account list
        billList.splice(index, 1);
        //Set modified account list
        component.set("v.billList", billList);
    },
    	
    saveBills: function(component, event, helper) {      
        if (helper.validateAccountRecords(component, event)) {
            //Call Apex method and pass account list as a parameters
            var spinner = component.find("spinner");
            $A.util.toggleClass(spinner, "slds-hide");
            var con = component.get("v.recordId");
            var action = component.get("c.saveBillList");
            action.setParams({
                "billList": component.get("v.billList"),
                "shipmentId": component.get("v.recordId"),
            });

            console.log('action:' + JSON.stringify(action));
            console.log('action:' + JSON.stringify(con));

            action.setCallback(this, function(response) {
                //get response status 
                var state = response.getState();
                if (state === "SUCCESS") {
                    //set empty account list
                    component.set("v.billList", []);
                    $A.util.toggleClass(spinner, "slds-hide");
                    alert('Bill saved successfully');
                    $A.enqueueAction(component.get('c.addRow'));
                    var url = "/lightning/r/clofor_com_cfs__MasterAnken__c/" + component.get("v.recordId")+"/view";
                    window.open(url, "_self");

                }
            }); 
            console.log('action:' + JSON.stringify(action));
            $A.enqueueAction(action);
            // $A.util.toggleClass(spinner, "slds-hide");

       }
    },
    onToggleSpinner: function(cmp){
        var spinner = cmp.find("spinner");
        $A.util.toggleClass(spinner, "slds-hide");
    },
})