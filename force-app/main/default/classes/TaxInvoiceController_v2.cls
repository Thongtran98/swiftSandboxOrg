public with sharing class TaxInvoiceController_v2 {
    public clofor_com_cfs__VAT_INVOICE__c vat {get; set;}

    public List<clofor_com_cfs__MasterAnkenMeisai__c> lstBill {get; set;}

    private static Set<String> setFieldsBill = new Set<String>();

    private static Set<String> setFieldsVAT = new Set<String>();

    public String strQueryVAT {get;set;}

    public String strQueryBill {get;set;}

    public String vatID {get;set;}

    public String typeRecord {get; set;}

    public List<String> minRow {get; set;}

    public Decimal totalAmount {get; set;}

    public Decimal grandTotal {get; set;}

    public Decimal grandTotalExchange {get; set;}

    public Decimal tenpercentTA {get; set;}

    public Boolean checkType {get; set;}

    public String InformationDisplay {get; set;}

    static{
        setFieldsVAT.add('Master__c');
        setFieldsVAT.add('Master__r.Name');
        setFieldsVAT.add('MShipper__c');
        setFieldsVAT.add('MCommodityType__c');
        setFieldsVAT.add('HConsignee__c');
        setFieldsVAT.add('HConsignee__c');
        setFieldsVAT.add('META__c');
        setFieldsVAT.add('MBLMAWB_No__c');
        setFieldsVAT.add('MGrossWeight__c');
        setFieldsVAT.add('MMeasurementTotalCBM__c');
        setFieldsVAT.add('MCargoQuantity__c');
        setFieldsVAT.add('MCargoUnit__c');
        setFieldsVAT.add('HShipper__c');
        setFieldsVAT.add('HCommodityType__c');
        setFieldsVAT.add('HConsignee__c');
        setFieldsVAT.add('HETA__c');
        setFieldsVAT.add('HBLHAWBNo__c');
        setFieldsVAT.add('HGrossWeight__c');
        setFieldsVAT.add('HMeasurementTotalCBM__c');
        setFieldsVAT.add('HCargoQuantity__c');
        setFieldsVAT.add('HCargoUnit__c');
        setFieldsVAT.add('clofor_com_cfs__VAT_INVOICE_TO__r.ACCOUNT_NAME_Khmer__c');
        setFieldsVAT.add('clofor_com_cfs__VAT_INVOICE_TO__r.Name');
        setFieldsVAT.add('clofor_com_cfs__VAT_INVOICE_TO__r.Khmer_Address__c');
        setFieldsVAT.add('clofor_com_cfs__VAT_INVOICE_TO__r.clofor_com_cfs__TAX_CODE__c');
        setFieldsVAT.add('clofor_com_cfs__RED_INVOICE_NO__c');
        setFieldsVAT.add('clofor_com_cfs__VATInvoicePrintDate__c');
        setFieldsVAT.add('clofor_com_cfs__ExchangeRate__c');
        setFieldsVAT.add('F_TMS_S_O__r.RecordType.Name');
        setFieldsVAT.add('clofor_com_cfs__VAT_INVOICE_TO__r.clofor_com_cfs__EnglishAddress__c');
        setFieldsVAT.add('MPODAOA__c');
        setFieldsVAT.add('MPOLAOD__c');
        setFieldsVAT.add('MGrossWeight__c');
        setFieldsVAT.add('MMeasurementTotalCBM__c');
        setFieldsVAT.add('MCargoQuantity__c');
        setFieldsVAT.add('MCargoUnit__c');
        setFieldsVAT.add('METD__c');
        setFieldsVAT.add('HGrossWeight__c');
        setFieldsVAT.add('HMeasurementTotalCBM__c');
        setFieldsVAT.add('HCargoQuantity__c');
        setFieldsVAT.add('HCargoUnit__c');
        setFieldsVAT.add('HPODAOA__c');
        setFieldsVAT.add('HPOLAOD__c');
        setFieldsVAT.add('HETD__c');
        setFieldsVAT.add('Information_Display__c');
        setFieldsVAT.add('Bank_Account__r.clofor_com_cfs__BankOfficialName__c');
        setFieldsVAT.add('Bank_Account__r.clofor_com_cfs__BankAccountNameInEng__c');
        setFieldsVAT.add('Bank_Account__r.clofor_com_cfs__BankAccountNumber__c');
    }
    static{
        setFieldsBill.add('clofor_com_cfs__BillNameAtPrintENG__c');
        setFieldsBill.add('clofor_com_cfs__Suryo__c');
        setFieldsBill.add('clofor_com_cfs__SellTankaUSD__c');
        setFieldsBill.add('clofor_com_cfs__SellAmountUSD__c');
        setFieldsBill.add('clofor_com_cfs__BillNameAtPrintLocal__c');
    }
    public TaxInvoiceController_v2() {
        vatID = ApexPages.currentPage().getParameters().get('id');
        vat = new clofor_com_cfs__VAT_INVOICE__c();
        strQueryBill = '';
        strQueryVAT = '';
        typeRecord = '';
        InformationDisplay = '';
        totalAmount = 0;
        strQueryBill = stringQueryBill(vatID);
        strQueryVAT = stringQueryVAT(vatID);
        vat = Database.query(strQueryVAT);
        lstbill = Database.query(strQueryBill);

        System.debug('vat :'+vat);
        typeRecord = vat.F_TMS_S_O__r.RecordType.Name;
        System.debug('vat :'+typeRecord);
        if(typeRecord == 'Air Export' || typeRecord == 'Air Import'){
            checkType = true;
        }else{
            checkType = false;
        }
        for(clofor_com_cfs__MasterAnkenMeisai__c i : lstBill){
            totalAmount += (i.clofor_com_cfs__SellAmountUSD__c != null) ? i.clofor_com_cfs__SellAmountUSD__c : 0;
        }
        minRow = new List<String>();
        if(lstbill.size() <= 10){
            for(Integer i = lstbill.size(); i<10; i++){
                minRow.add('');
            }
        }
        if(vat.Information_Display__c == '--None--'){
            InformationDisplay = 'NONE';
        }
        if(vat.Information_Display__c == 'House bill details'){
            InformationDisplay = 'HOUSE';
        }
        if(vat.Information_Display__c == 'Master bill details'){
            InformationDisplay = 'MASTER';
        }

        grandTotal = 0;
        grandTotalExchange = 0;
        tenpercentTA = 0;
        tenpercentTA = (totalAmount/100)*10;
        grandTotal = totalAmount + tenpercentTA;
        grandTotal = grandTotal.setScale(2);

        grandTotalExchange = grandTotal * ((vat.clofor_com_cfs__ExchangeRate__c != null) ? vat.clofor_com_cfs__ExchangeRate__c : 0);

        totalAmount = totalAmount.setScale(2);
        tenpercentTA = tenpercentTA.setScale(2);
        grandTotalExchange = grandTotalExchange.setScale(2);
    }
    private String stringQueryVAT(String vatID){
        
        String strSelect = 'SELECT ' + String.join(new List<String>(setFieldsVAT), ',');
        String strFrom = ' FROM clofor_com_cfs__VAT_INVOICE__c ';
        String strWhere = 'WHERE Id = \'' + vatID + '\'' ;
        String strOrderBy = ' ORDER BY Name';
        return strSelect + strFrom + strWhere + strOrderBy;
    }
    private String stringQueryBill(String vatID){
        // clofor_com_cfs__CustomObject1__c bills2 = [SELECT clofor_com_cfs__Field1__c
        // FROM clofor_com_cfs__CustomObject1__c
        // WHERE Id =: reimID
        // ORDER By Name];

        // customerName = bills2.clofor_com_cfs__Field1__c;
        
        String strSelect = 'SELECT ' + String.join(new List<String>(setFieldsBill), ',');
        String strFrom = ' FROM clofor_com_cfs__MasterAnkenMeisai__c ';
        // String strWhere = 'WHERE Reimbursement_Record_ID__c = \'' + reimID + '\'' + ' AND Included_in_tax_invoice_selling__c = false' + ' AND clofor_com_cfs__Seikyusaki__c = \'' + customerName + '\'' ;
        String strWhere = 'WHERE TaxInvoice__c = \'' + vatID + '\'' ;
        String strOrderBy = ' ORDER BY Name';
        return strSelect + strFrom + strWhere + strOrderBy;
    }

}