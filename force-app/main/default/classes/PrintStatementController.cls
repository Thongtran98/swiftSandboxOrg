public with sharing class PrintStatementController {
    public String soaId {get; set;}
    public SOA_payment__c soa {get; set;}
    public List<SOA_payment_Bill__c> lstSoaBill {get; set;}
    public Decimal totalPreBalance {get; set;}
    public Decimal totalCredit {get; set;}
    public Decimal totalDebit {get; set;}
    public Decimal total {get; set;}
    
    private static Set<String> setFieldSoa = new Set<String>();
    private static Set<String> setFieldSoaBill = new Set<String>();

    static {
        setFieldSoaBill.add('Name');
        setFieldSoaBill.add('SOA_payment__c');
        setFieldSoaBill.add('F_TMS_Bill__c');
        setFieldSoaBill.add('F_TMS_Bill__r.clofor_com_cfs__SalesAccountedDateInvoicing__c');
        setFieldSoaBill.add('F_TMS_Bill__r.Name');
        setFieldSoaBill.add('F_TMS_Bill__r.clofor_com_cfs__Anken__r.clofor_com_cfs__JobRequestID__c');
        setFieldSoaBill.add('F_TMS_Bill__r.clofor_com_cfs__SellInTaxAmount_USD__c');
    }

    static {
        setFieldSoa.add('Name');
        setFieldSoa.add('Date__c');
        setFieldSoa.add('Statement__c');
        setFieldSoa.add('Bill_to_details_info__c');
    }

    public PrintStatementController() {
        totalPreBalance = 0;
        totalCredit = 0;
        totalDebit = 0;
        total = 0;
        soaId = Apexpages.currentPage().getParameters().get('Id');
        soa = getDataSoa(soaId);
        lstSoaBill = getDataSoaBill(soaId);
    }

    private SOA_payment__c getDataSoa(String Id) {
        SOA_payment__c sP = new SOA_payment__c();
        String querySoa = 'SELECT '+String.join(new List<String>(setFieldSoa), ',')+ ' FROM SOA_payment__c WHERE Id = \''+ Id + '\'';
        sP = Database.query(querySoa);
        return sP;
    }

    private List<SOA_payment_Bill__c> getDataSoaBill(String soaId) {
        List<SOA_payment_Bill__c> lstSB = new List<SOA_payment_Bill__c>();
        String querySB = 'SELECT '+String.join(new List<String>(setFieldSoaBill), ',')+ ' FROM SOA_payment_Bill__c WHERE SOA_payment__c = \''+ soaId + '\'';
        lstSB = Database.query(querySB);
        for (SOA_payment_Bill__c sB : lstSB){
            // sB.F_TMS_Bill__r.clofor_com_cfs__SellInTaxAmount_USD__c != null ? totalDebit += sB.F_TMS_Bill__r.clofor_com_cfs__SellInTaxAmount_USD__c : totalDebit += 0;
            if (sB.F_TMS_Bill__r.clofor_com_cfs__SellInTaxAmount_USD__c != null)
                totalDebit += sB.F_TMS_Bill__r.clofor_com_cfs__SellInTaxAmount_USD__c ;
        }
        total = totalDebit;
        return lstSB;
    }
}