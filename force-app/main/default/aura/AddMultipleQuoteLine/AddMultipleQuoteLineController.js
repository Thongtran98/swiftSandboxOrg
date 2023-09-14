({
    doinit: function (component, event, helper) {
      $A.enqueueAction(component.get('c.addRow'));
    },
  
    addRow: function (component, event, helper) {
      var lstObject = component.get("v.lstObject");

          lstObject.push({
            sobjectType: "clofor_com_cfs__QuoteLine__c",
            //clofor_com_cfs__PrintingSection__c: "",
            clofor_com_cfs__ServicePricingID__c: "",
            clofor_com_cfs__Print__c: true,
            clofor_com_cfs__Quantity__c: "",
            clofor_com_cfs__Unit__c: "",
            clofor_com_cfs__ContainerType__c: "",
            clofor_com_cfs__CurrencySelling__c: "",
            clofor_com_cfs__TaxInitial__c: "",
            clofor_com_cfs__SellingListPriceLocal__c: "",
            clofor_com_cfs__SellingListPriceUSD__c: "",
            clofor_com_cfs__BuyTaxInitial__c: "",
            clofor_com_cfs__CurrencyBuying__c: "",
            clofor_com_cfs__BuyingListPriceLocal__c: "",
            clofor_com_cfs__BuyingListPriceUSD__c: "",
            clofor_com_cfs__TaxRateBuying__c: "",
            clofor_com_cfs__Remarks__c: ""
          });
          component.set("v.lstObject", lstObject);
      console.log(JSON.stringify(lstObject))
    },
  
    removeRecord: function (component, event, helper) {
      var lstObject = component.get("v.lstObject");
      var selectedItem = event.currentTarget;
      var index = selectedItem.dataset.record;
      lstObject.splice(index, 1);
      component.set("v.lstObject", lstObject);
    },
  
    saveBills: function (component, event, helper) {
      // if (helper.validateAccountRecords(component, event)) {
        var spinner = component.find("spinner");
        $A.util.toggleClass(spinner, "slds-hide");
  
        var action = component.get("c.saveQuoteLineList");
        action.setParams({
          quoteLineList: component.get("v.lstObject"),
          quoteId: component.get("v.recordId")
        });
  
        action.setCallback(this, function (response) {
          var state = response.getState();
          if (state === "SUCCESS") {
            component.set("v.lstObject", []);
            $A.util.toggleClass(spinner, "slds-hide");
            alert("Saved successfully");
            $A.enqueueAction(component.get('c.addRow'));
            var url = "/lightning/r/clofor_com_cfs__Quote__c/" + component.get("v.recordId")+"/view";
            window.open(url, "_self");
  
          }
        });
        $A.enqueueAction(action);
      // }
    },
    onToggleSpinner: function (cmp) {
      var spinner = cmp.find("spinner");
      $A.util.toggleClass(spinner, "slds-hide");
    }
  });