public with sharing class TelexReleaseController {
    public clofor_com_cfs__CustomObject1__c shipment {get; set;}
    public clofor_com_cfs__AnkenMeisai__c billing {get; set;}
    public clofor_com_cfs__Custom_Clearance__c CClearance {get; set;}

    public String shipmentID {get; set;}
    public String strQuery {get; set;}
    public String strQueryCClearance {get; set;}
    public Date prindate {get;set;}

    private static Set<String> setFields = new Set<String>();
    private static Set<String> setField1 = new Set<String>();
    private static Set<String> setFieldsBill = new Set<String>();

    static{
        setFields.add('Id');
        setFields.add('Name');
        setFields.add('clofor_com_cfs__ADDRESS_ON_B_L__c');
        setFields.add('clofor_com_cfs__HBL_Number_SEA_AIR__c');
        setFields.add('clofor_com_cfs__CNEE_ADDRESS_ON_B_L__c');
        setFields.add('clofor_com_cfs__NOTIFY_ADDRESS_ON_B_L__c');
        setFields.add('clofor_com_cfs__Vessle__c');
        setFields.add('clofor_com_cfs__Voy_No__c');
        setFields.add('MTR_Vessel_and_Voy_No__c');
        setFields.add('clofor_com_cfs__PortOfLoadingDetailPrint__c');
        setFields.add('clofor_com_cfs__MBL_Number_SEA_AIR__c');
        setFields.add('clofor_com_cfs__PortOfDischargeDetailPrint__c');
        setFields.add('clofor_com_cfs__Freight_Collect_Prepaid__c');
        setFields.add('clofor_com_cfs__PlaceOfDeliveryDetailPrint__c');
        setFields.add('clofor_com_cfs__CARGO_TYPE__c');
        setFields.add('Load_type__c');
        setFields.add('clofor_com_cfs__ETD__c');
        setFields.add('clofor_com_cfs__ETA__c');
        
        setFields.add('clofor_com_cfs__Marks_and_Numbers__c');
        setFields.add('clofor_com_cfs__carton__c');
        setFields.add('clofor_com_cfs__UnitType__c');
        setFields.add('clofor_com_cfs__Item__c');
        setFields.add('clofor_com_cfs__weight__c');
        setFields.add('clofor_com_cfs__CBM__c');
        setFields.add('clofor_com_cfs__CONTAINERSEALNO__c');
        setFields.add('clofor_com_cfs__PriceTerms__c ');
        setFields.add('clofor_com_cfs__POD__c ');
        setFields.add('clofor_com_cfs__POD__r.Name');
        setFields.add('clofor_com_cfs__Remarks__c ');
        setFields.add('clofor_com_cfs__Field1__r.clofor_com_cfs__EnglishAddress__c');
        setFields.add('clofor_com_cfs__SalesAccountedDate__c');
        setFields.add('clofor_com_cfs__Cnee__r.Name');
        setFields.add('clofor_com_cfs__HBL__c');
    }
    static{
        setField1.add('Place_of_Clearance__c');
    }

    public TelexReleaseController() {
       
        shipment = new clofor_com_cfs__CustomObject1__c();
        shipmentID = ApexPages.currentPage().getParameters().get('id');
        strQuery = stringQueryShipment(shipmentID);
        strQueryCClearance = stringQueryCClearance(shipmentID);
        shipment = Database.query(strQuery);
        // CClearance = Database.query(strQueryCClearance);
        prindate = System.today();
    }


    private String stringQueryShipment(String shipmentId){
        String strSelect = 'SELECT ' + String.join(new List<String>(setFields), ',');
        String strFrom = ' FROM clofor_com_cfs__CustomObject1__c ';
        String strWhere = 'WHERE Id = \'' + shipmentId + '\'' ;
        String strOrderBy = ' ORDER BY Name';
        return strSelect + strFrom + strWhere + strOrderBy;
    }
    private String stringQueryCClearance(String shipmentId){
        String strSelect = 'SELECT ' + String.join(new List<String>(setField1), ',');
        String strFrom = ' FROM clofor_com_cfs__Custom_Clearance__c ';
        String strWhere = 'WHERE clofor_com_cfs__HBL_SHIPMENT__c = \'' + shipmentId + '\'' ;
        String strOrderBy = ' ORDER BY Name LIMIT 1';
        return strSelect + strFrom + strWhere + strOrderBy;
    }
}