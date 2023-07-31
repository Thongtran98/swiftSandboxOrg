public with sharing class CreditController {
    public String shipmentID {get; set;}
    public String cusId{get;set;}
    public String BillTo{get;set;}
    public String typeRecord{get;set;}
    public Decimal totalAmount{get;set;}
    private static Set<String> setFieldsShip = new Set<String>();
    private static Set<String> setFieldsBill = new Set<String>();
    private static Set<String> setFieldsAcc = new Set<String>();
    public clofor_com_cfs__CustomObject1__c shipment {get; set;}
    public List<clofor_com_cfs__MasterAnkenMeisai__c> arrResult {get;set;}
    public Account acc {get; set;}
    public List<clofor_com_cfs__MasterAnkenMeisai__c> lstBill {get; set;}


    static {
        setFieldsShip.add('Id');
        setFieldsShip.add('clofor_com_cfs__WkInitial__c');
        setFieldsShip.add('clofor_com_cfs__MasterAnkenName__r.Name');
        setFieldsShip.add('Name');
        setFieldsShip.add('clofor_com_cfs__HBL__c');
        setFieldsShip.add('clofor_com_cfs__HAWB__c');
        setFieldsShip.add('clofor_com_cfs__shipper__r.Name');
        setFieldsShip.add('clofor_com_cfs__Cnee__r.Name');
        setFieldsShip.add('clofor_com_cfs__Commodity_Type__c');
        setFieldsShip.add('clofor_com_cfs__ETA__c');
    }

    static {
        setFieldsBill.add('Name');
        setFieldsBill.add('clofor_com_cfs__BillNameAtPrintENG__c');
        setFieldsBill.add('clofor_com_cfs__Suryo__c');
        setFieldsBill.add('clofor_com_cfs__SellTankaUSD__c');
        setFieldsBill.add('AmountSellingIncludingTaxFCY__c');
    }

    static {
        setFieldsAcc.add('Name');
    }

    public CreditController() {
        shipmentID = ApexPages.currentPage().getParameters().get('id');
        cusId = ApexPages.currentPage().getParameters().get('cusId');
        totalAmount = 0;
        typeRecord = '';
        arrResult = new List<clofor_com_cfs__MasterAnkenMeisai__c>();

        System.debug('cusId :'+cusId);
        String strShipment = getDataShipment(shipmentID);
        shipment = Database.query(strShipment);
        lstBill = getDataListBill(shipmentId, cusId);
        String BillToQuery = 'SELECT Id, Name From Account WHERE Id = \''+ cusId + '\'';
        acc = Database.query(BillToQuery);
        System.debug('acc :'+acc);
        for(clofor_com_cfs__MasterAnkenMeisai__c e : lstBill){
            totalAmount += e.AmountSellingIncludingTaxFCY__c;
        }
        if(shipment.RecordType.Name == 'Sea Import' || shipment.RecordType.Name == 'Sea Export' || shipment.RecordType.Name == 'Sea - Land Import' || shipment.RecordType.Name == 'Land - Sea Export'){
            typeRecord = shipment.clofor_com_cfs__HBL__c;
        }
        if(shipment.RecordType.Name == 'Air Import' || shipment.RecordType.Name == 'Air Export' || shipment.RecordType.Name == 'Air - Land Import' || shipment.RecordType.Name == 'Land - Air Export'){
            typeRecord = shipment.clofor_com_cfs__HAWB__c;
        }
        Integer a = 0;
        if(lstBill.size() < 10){
            a= 10- lstBill.size();
        }

        for(Integer i = 0; i<=a;i++){
            clofor_com_cfs__MasterAnkenMeisai__c arr = new clofor_com_cfs__MasterAnkenMeisai__c();
            arrResult.add(arr);
        }
    }

    private String getDataShipment(String shipmentId){
        String strSelect = 'SELECT RecordType.Name,' + String.join(new List<String>(setFieldsShip), ',');
        String strFrom = ' FROM clofor_com_cfs__CustomObject1__c ';
        String strWhere = 'WHERE Id = \'' + shipmentId + '\'' ;
        String strOrderBy = ' ORDER BY Name LIMIT 1';
        return strSelect + strFrom + strWhere + strOrderBy;
    }

    private List<clofor_com_cfs__MasterAnkenMeisai__c> getDataListBill (String shipID, String cusId) {
        List<clofor_com_cfs__MasterAnkenMeisai__c> listBill = new List<clofor_com_cfs__MasterAnkenMeisai__c>();
        String querylstBill = 'SELECT '+String.join(new List<String>(setFieldsBill), ',')+ ' FROM clofor_com_cfs__MasterAnkenMeisai__c WHERE Shipment__c = \''+ shipID + '\' AND clofor_com_cfs__PaymentTo__c = \'' + cusId + '\'';
        listBill = Database.query(querylstBill);
        return listBill;
    }

}