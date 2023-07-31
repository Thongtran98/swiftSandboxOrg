public with sharing class CreditSelectionController {
    public String shipmentID {get; set;}
    public String selectedCustomerId {get; set;}
    public Boolean requiredAttachmentCreation{get; set;}
    public String openUrl {get; set;}
    public String errorMessage {get; private set;}
    public String customerId{get;set;}
    public String attachName{get;set;}


    public CreditSelectionController() {
        shipmentID = ApexPages.currentPage().getParameters().get('id');
        errorMessage = null;
    }

    public List<SelectOption> getCustomers() {
        List<clofor_com_cfs__MasterAnkenMeisai__c > bills = [SELECT clofor_com_cfs__PaymentTo__c, clofor_com_cfs__PaymentTo__r.Name FROM clofor_com_cfs__MasterAnkenMeisai__c  WHERE Shipment__c =: shipmentID];
        List<SelectOption> options = new List<SelectOption>();
        Set<String> lstCus = new Set<String>();
        for (clofor_com_cfs__MasterAnkenMeisai__c  bill : bills){
            if (!lstCus.contains(bill.clofor_com_cfs__PaymentTo__c) && bill.clofor_com_cfs__PaymentTo__c != null){
                lstCus.add(bill.clofor_com_cfs__PaymentTo__c);
                options.add(new SelectOption(bill.clofor_com_cfs__PaymentTo__c, bill.clofor_com_cfs__PaymentTo__r.Name));
            }
        }
        return options;
    }
    public void generateReport() {
        errorMessage = null;
        if (StringUtils.isEmpty(selectedCustomerId)) {
            errorMessage = 'You have not selected any customer/partner or no customer/partner is applicable.';
        }  else {
            if (requiredAttachmentCreation) {
                String attachmentId = createAttachment(shipmentID,selectedCustomerId);
                openUrl = '/servlet/servlet.FileDownload?file=' + attachmentId;
            } else {
                openUrl = '/apex/page_CreditForm?Id=' + shipmentID+ '&cusId=' + selectedCustomerId;
            }
        }      
    }
    private String createAttachment(String shipid, String customerId) {
        if (PermissionValidationUtil.isCreatableAttachment()) {
            PageReference pageRef = new PageReference('/apex/page_CreditForm');
            pageRef.getParameters().put('Id',shipid);
            pageRef.getParameters().put('cusId',customerId);
            String attachName = 'Credit Notes' + ' v';
	        String attachNameSearch = attachName + '%';
	        // get exist file Name
	        List<Attachment> attachments = [SELECT Id, Name, ParentId 
	                                        FROM Attachment 
	                                        WHERE Name LIKE : attachNameSearch 
	                                        ORDER BY CreatedDate DESC LIMIT 1];
	        if(attachments.isEmpty()){
	            attachName += '1.1';
	        }else{
	            String attachNameExist = attachments[0].Name;
	            attachNameExist = attachNameExist.substringAfter(attachName);
	            attachNameExist = attachNameExist.substringBefore('.pdf');
	            Decimal versionNumber = Decimal.valueOf(attachNameExist);
	            versionNumber += 0.1;
	            attachName += String.valueOf(versionNumber);
	        }
	        Attachment attach = new Attachment();
	        Blob body;
	        attach.Name = attachName + '.pdf'; 
	        attach.IsPrivate = false;
            attach.ParentId = shipid;
	        if(!Test.isRunningTest()){
	            body = pageRef.getContentAsPDF();
	            attach.Body = body;
	            FlsService.doInsert(attach);
	        }
            return attach.Id;
        }
        return null;
    }
}