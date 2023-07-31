public with sharing class DeliveryOrderController {
    public clofor_com_cfs__CustomObject1__c DeliveryOrder{get;set;}
    public String DeliveryOrderId{get;set;}
    private static Set<String> setFields = new Set<String>();
    public String strQuery {get; set;}
    public clofor_com_cfs__CustomObject1__c getName {get; set;}
    public String NameOfUser {get; set;}

    static{
        setFields.add('clofor_com_cfs__Cnee__r.Name');
        setFields.add('clofor_com_cfs__HBL_Number_SEA_AIR__c');
        setFields.add('clofor_com_cfs__MBL_Number_SEA_AIR__c');
        setFields.add('clofor_com_cfs__PortOfLoadingDetailPrint__c');
        setFields.add('clofor_com_cfs__PortOfDischargeDetailPrint__c');
        setFields.add('clofor_com_cfs__Vessle__c');
        setFields.add('clofor_com_cfs__Voy_No__c');
        setFields.add('clofor_com_cfs__carton__c');
        setFields.add('clofor_com_cfs__UnitType__c');
        setFields.add('clofor_com_cfs__weight__c');
        setFields.add('clofor_com_cfs__CBM__c');
        setFields.add('clofor_com_cfs__CONTAINERSEALNO__c');
    }
    public DeliveryOrderController() {
        DeliveryOrder = new clofor_com_cfs__CustomObject1__c();
        DeliveryOrderId = '';
        DeliveryOrderId = ApexPages.currentPage().getParameters().get('id');
        strQuery = stringQueryDelivery(DeliveryOrderId);
        DeliveryOrder = Database.query(strQuery);
        NameOfUser = UserInfo.getName();
    }

    private String stringQueryDelivery(String DeliveryOrderId){
        String strSelect = 'SELECT ' + String.join(new List<String>(setFields), ',');
        String strFrom = ' FROM clofor_com_cfs__CustomObject1__c ';
        String strWhere = 'WHERE Id = \'' + DeliveryOrderId + '\'' ;
        String strOrderBy = ' ORDER BY Name LIMIT 1';
        return strSelect + strFrom + strWhere + strOrderBy;
    }
}