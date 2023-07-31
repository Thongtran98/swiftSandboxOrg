public with sharing class TaxInvoiceController {

    public clofor_com_cfs__VAT_INVOICE__c vatObj {get; set;}

    public List<clofor_com_cfs__CustomObject1__c> shippingOrderList {get; set;}

    public List<clofor_com_cfs__FORWARDING_VAT__c> vatShippingOrderList {get; set;}

    public List<clofor_com_cfs__AnkenMeisai__c> vatBillList {get; set;}

    public List<clofor_com_cfs__Container_Info__c> cntrList {get; set;}

    public List<String> minRow {get; set;}

    public List<String> minCntrRow {get; set;}

    public Decimal totalAmount {get; set;}

    public Decimal tenpercentTA {get; set;}

    public Decimal grandTotal {get; set;}

    public Decimal grandTotalExchange {get; set;}

    public String airImportType {get; set;}
    
    public String airExportType {get; set;}

    public String seaImportType {get; set;}

    public String seaExportType {get; set;}

    public String oceanImportType {get; set;}

    public String oceanExportType {get; set;}


    //----------------------------------------------------------------

    private static Set<String> setFieldVatINVList = new Set<String>();

    private static Set<String> setFieldShippingOrderList = new Set<String>();

    private static Set<String> setFieldBillList = new Set<String>();

    private static Set<String> setFieldVatShippingOrderList = new Set<String>();

    private static Set<String> setFieldVatBillList = new Set<String>();

    private static Set<String> setFieldCNTR = new Set<String>();

     // setFieldVatINVList.add('');
    static{
       
        setFieldVatINVList.add('clofor_com_cfs__VAT_INVOICE_TO__r.ACCOUNT_NAME_Khmer__c');
        setFieldVatINVList.add('clofor_com_cfs__VAT_INVOICE_TO__r.Name');
        setFieldVatINVList.add('clofor_com_cfs__VAT_INVOICE_TO__r.ADDRESS_Khmer__c');
        setFieldVatINVList.add('clofor_com_cfs__VAT_INVOICE_TO__r.clofor_com_cfs__EnglishAddress__c');
        setFieldVatINVList.add('clofor_com_cfs__RED_INVOICE_NO__c');
        setFieldVatINVList.add('clofor_com_cfs__VATInvoicePrintDate__c');
        setFieldVatINVList.add('clofor_com_cfs__ExchangeRate__c');
    }

    // setFieldShippingOrderList.add('');
    static{
        
        setFieldShippingOrderList.add('clofor_com_cfs__ShipperEnglishCompanyName__c');
        setFieldShippingOrderList.add('clofor_com_cfs__Commodity_Type__c');
        setFieldShippingOrderList.add('clofor_com_cfs__Account_Cnee_Eng_name__c');
        setFieldShippingOrderList.add('clofor_com_cfs__ETA__c');
        setFieldShippingOrderList.add('clofor_com_cfs__HAWB__c');
        setFieldShippingOrderList.add('clofor_com_cfs__weight__c');
        setFieldShippingOrderList.add('clofor_com_cfs__CBM__c');
        setFieldShippingOrderList.add('clofor_com_cfs__carton__c');
        setFieldShippingOrderList.add('clofor_com_cfs__UnitType__c');
        setFieldShippingOrderList.add('clofor_com_cfs__ExchangeRate__c');
        setFieldShippingOrderList.add('clofor_com_cfs__JobRequestID__c');
    }

    // setFieldBillList.add('');
    static{
        setFieldBillList.add('Name');
        setFieldBillList.add('Tax_Invoice_ID__r.Name');
        setFieldBillList.add('clofor_com_cfs__InsatuyouSyohin__c');
        setFieldBillList.add('clofor_com_cfs__InsatuyouSyohinEng__c');
        setFieldBillList.add('clofor_com_cfs__Suryo__c');
        setFieldBillList.add('clofor_com_cfs__SellTankaUSD__c');
        setFieldBillList.add('clofor_com_cfs__SellAmountUSD__c');
    }

    // setFieldVatShippingOrderList.add('');
    static{
        setFieldVatShippingOrderList.add('clofor_com_cfs__FORWARDING__r.Id');
        setFieldVatShippingOrderList.add('clofor_com_cfs__FORWARDING__r.Name');
        setFieldVatShippingOrderList.add('clofor_com_cfs__FORWARDING__r.RecordTypeId');
        setFieldVatShippingOrderList.add('clofor_com_cfs__FORWARDING__r.Load_type__c');
        setFieldVatShippingOrderList.add('clofor_com_cfs__VAT_INVOICE__r.Name');
        setFieldVatShippingOrderList.add('clofor_com_cfs__FORWARDING__r.clofor_com_cfs__ShipperEnglishCompanyName__c');
        setFieldVatShippingOrderList.add('clofor_com_cfs__FORWARDING__r.clofor_com_cfs__Commodity_Type__c');
        setFieldVatShippingOrderList.add('clofor_com_cfs__FORWARDING__r.clofor_com_cfs__Account_Cnee_Eng_name__c');
        setFieldVatShippingOrderList.add('clofor_com_cfs__FORWARDING__r.clofor_com_cfs__ETA__c');
        setFieldVatShippingOrderList.add('clofor_com_cfs__FORWARDING__r.clofor_com_cfs__ETD__c');
        setFieldVatShippingOrderList.add('clofor_com_cfs__FORWARDING__r.clofor_com_cfs__POL__c');
        setFieldVatShippingOrderList.add('clofor_com_cfs__FORWARDING__r.clofor_com_cfs__POD__c');
        setFieldVatShippingOrderList.add('clofor_com_cfs__FORWARDING__r.clofor_com_cfs__HAWB__c');
        setFieldVatShippingOrderList.add('clofor_com_cfs__FORWARDING__r.clofor_com_cfs__weight__c');
        setFieldVatShippingOrderList.add('clofor_com_cfs__FORWARDING__r.clofor_com_cfs__CBM__c');
        setFieldVatShippingOrderList.add('clofor_com_cfs__FORWARDING__r.clofor_com_cfs__carton__c');
        setFieldVatShippingOrderList.add('clofor_com_cfs__FORWARDING__r.clofor_com_cfs__UnitType__c');
        setFieldVatShippingOrderList.add('clofor_com_cfs__FORWARDING__r.clofor_com_cfs__JobRequestID__c');
    }

    static{
        setFieldCNTR.add('clofor_com_cfs__HBL_SHIPMENT__r.Id');
        setFieldCNTR.add('clofor_com_cfs__Container_NO__c');
        setFieldCNTR.add('clofor_com_cfs__Container__c');
    }

    public TaxInvoiceController() {
        
        String vatId = ApexPages.currentPage().getParameters().get('id');
        vatObj = Database.query(stringQueryVatINV(vatId));
        vatBillList = Database.query(stringQueryBillByVat(vatId));
        totalAmount = 0;
        airImportType = '';
        airExportType = '';
        seaImportType = '';
        seaExportType = '';
        oceanImportType = '';
        oceanExportType = '';
        for(clofor_com_cfs__AnkenMeisai__c i : vatBillList){
            totalAmount += (i.clofor_com_cfs__SellAmountUSD__c != null) ? i.clofor_com_cfs__SellAmountUSD__c : 0;
        }
        minRow = new List<String>();
        if(vatBillList.size() <= 10){
            for(Integer i = vatBillList.size(); i<10; i++){
                minRow.add('');
            }
        }
        
        grandTotal = 0;
        grandTotalExchange = 0;
        tenpercentTA = 0;
        tenpercentTA = (totalAmount/100)*10;
        grandTotal = totalAmount + tenpercentTA;
        grandTotalExchange = grandTotal * ((vatObj.clofor_com_cfs__ExchangeRate__c != null) ? vatObj.clofor_com_cfs__ExchangeRate__c : 1);

        totalAmount = totalAmount.setScale(2);
        tenpercentTA = tenpercentTA.setScale(2);
        grandTotal = grandTotal.setScale(2);
        grandTotalExchange = grandTotalExchange.setScale(2);

        vatShippingOrderList = Database.query(stringQueryVatSO(vatId));

        List<String> soIds = new List<String>();
        for (clofor_com_cfs__FORWARDING_VAT__c i : vatShippingOrderList) {
            soIds.add(i.clofor_com_cfs__FORWARDING__r.Id+'');
        }

        cntrList = Database.query(stringQueryCNTRBySO(soIds));
        minCntrRow = new List<String>();
        if(cntrList.size() <= 5){
            for(Integer i = cntrList.size(); i<5; i++){
                minCntrRow.add('');
            }
        }

        airImportType = getRecordTypeIdbyName('clofor_com_cfs__CustomObject1__c', 'Air Import');
        airExportType = getRecordTypeIdbyName('clofor_com_cfs__CustomObject1__c', 'Air Export');
        seaImportType = getRecordTypeIdbyName('clofor_com_cfs__CustomObject1__c', 'Sea Import');
        seaExportType = getRecordTypeIdbyName('clofor_com_cfs__CustomObject1__c', 'Sea Export');
        oceanImportType = getRecordTypeIdbyName('clofor_com_cfs__CustomObject1__c', 'Ocean Import');
        oceanExportType = getRecordTypeIdbyName('clofor_com_cfs__CustomObject1__c', 'Ocean Export');

    }

    public String getRecordTypeIdbyName(String objectName, String strRecordTypeName){
        String result = '';
        List<RecordType> queryRs = [Select Id FROM RecordType WHERE sObjectType= :objectName AND Name = :strRecordTypeName];
        if(queryRs != null){
            result = queryRs[0].Id + '';
        }
        return result;
    }

    private String stringQueryVatINV(String Id){
        String strSelect = 'SELECT ' + String.join(new List<String>(setFieldVatINVList), ',');
        String strFrom = ' FROM clofor_com_cfs__VAT_INVOICE__c ';
        String strWhere = (Id != null) ? ' WHERE Id = \'' + Id + '\'' : '';
        
        return strSelect + strFrom + strWhere;
    }

    private String stringQuerySO(String Id){
        String strSelect = 'SELECT ' + String.join(new List<String>(setFieldShippingOrderList), ',');
        String strFrom = ' FROM clofor_com_cfs__CustomObject1__c ';
        String strWhere = (Id != null) ? ' WHERE Id = \'' + Id + '\'' : '';
        
        return strSelect + strFrom + strWhere;
    }

    private String stringQueryBill(String Id){
        String strSelect = 'SELECT ' + String.join(new List<String>(setFieldBillList), ',');
        String strFrom = ' FROM clofor_com_cfs__AnkenMeisai__c ';
        String strWhere = (Id != null) ? ' WHERE Id = \'' + Id + '\'' : '';
        
        return strSelect + strFrom + strWhere;
    }

    private String stringQueryVatSO(String Id){
        String strSelect = 'SELECT ' + String.join(new List<String>(setFieldVatShippingOrderList), ',');
        String strFrom = ' FROM clofor_com_cfs__FORWARDING_VAT__c ';
        String strWhere = (Id != null) ? ' WHERE clofor_com_cfs__VAT_INVOICE__r.Id = \'' + Id + '\'' : '';
        
        return strSelect + strFrom + strWhere;
    }

    private String stringQueryBillByVat(String Id){
        String strSelect = 'SELECT ' + String.join(new List<String>(setFieldBillList), ',');
        String strFrom = ' FROM clofor_com_cfs__AnkenMeisai__c ';
        String strWhere = (Id != null) ? ' WHERE Tax_Invoice_ID__r.Id = \'' + Id + '\'' : '';
        
        return strSelect + strFrom + strWhere;
    }

    private String stringQueryCNTRBySO(List<String> ids){
        String strSelect = 'SELECT ' + String.join(new List<String>(setFieldCNTR), ',');
        String strFrom = ' FROM clofor_com_cfs__Container_Info__c ';
        String strWhere = '';
        if(ids.size() > 0){
            strWhere = ' WHERE ';
            String strIds = '';
            String Id;
            for(Integer i = 0; i< ids.size(); i++){
                Id = ids.get(i);
                if(strIds == '' && Id != ''){
                    strIds += ' clofor_com_cfs__HBL_SHIPMENT__r.Id = \'' + Id + '\'';
                } else if(Id != null) {
                    strIds += ' OR clofor_com_cfs__HBL_SHIPMENT__r.Id = \'' + Id + '\'';
                } else {
                    strIds += '';
                }
            }
            strWhere += strIds;
        }
        System.debug('TEST: '+ strSelect + strFrom + strWhere);
        return strSelect + strFrom + strWhere;
    }

    
}