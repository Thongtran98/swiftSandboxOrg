public with sharing class CargoesReceiptController {
    public clofor_com_cfs__CustomObject1__c shipment {get;set;}
    public String strQueryShipment {get;set;}
    private static Set<String> setFieldShipment =  new Set<String>();
    private String shipmentId {get;set;}

    public List<AggregateResult> lstCon {get;set;}
    public String strQueryCon {get;set;}
    private static Set<String> setFieldCon = new Set<String>();
    public Decimal sumCtns {get;set;}
    public Decimal sumWeight {get;set;}
    public Decimal sumCBM {get;set;}
    public Decimal sumActCBM {get;set;}

    static {
        setFieldShipment.add('clofor_com_cfs__ADDRESS_ON_B_L__c');
        setFieldShipment.add('clofor_com_cfs__CNEE_ADDRESS_ON_B_L__c');
        setFieldShipment.add('P_O_No__c');
        setFieldShipment.add('Order_No__c');
        setFieldShipment.add('clofor_com_cfs__Style_Number__c');
        setFieldShipment.add('Article_No__c');
        setFieldShipment.add('clofor_com_cfs__TotalContainerQuantity__c');
        setFieldShipment.add('clofor_com_cfs__weight__c');
        setFieldShipment.add('clofor_com_cfs__CBM__c');
        setFieldShipment.add('Date_of_delivery__c');
        setFieldShipment.add('clofor_com_cfs__CONTAINERSEALNO__c');
        setFieldShipment.add('Time_of_delivery__c');
        setFieldShipment.add('Delivery_by__c');
        setFieldShipment.add('Trucking_No__c');
        setFieldShipment.add('Tel__c');
        setFieldShipment.add('Date_of_Received__c');
        setFieldShipment.add('Time_of_Received__c');
        setFieldShipment.add('Received_by__c');

        setFieldCon.add('P_O_No__c');
        setFieldCon.add('Order_No__c');
        setFieldCon.add('Style_No__c');
        setFieldCon.add('Article_No__c');
        setFieldCon.add('clofor_com_cfs__GROSS_WEIGHT__c');
        setFieldCon.add('clofor_com_cfs__MEASUREMENT_CBM__c');
        setFieldCon.add('Actual_CBM__c');

    }

    public CargoesReceiptController() {
        shipment =  new clofor_com_cfs__CustomObject1__c();
        lstCon = new List<AggregateResult>();

        strQueryShipment = '';
        strQueryCon = '';
        sumCtns = 0;
        sumWeight = 0;
        sumCBM = 0;
        sumActCBM = 0;
        shipmentId = ApexPages.currentPage().getParameters().get('id');

        strQueryShipment = stringQueryShipment(shipmentId);
        shipment = getDataShipment(strQueryShipment);

        lstCon = [select P_O_No__c,Order_No__c,Article_No__c,Style_No__c,COUNT(Id),sum(clofor_com_cfs__GROSS_WEIGHT__c),sum(clofor_com_cfs__MEASUREMENT_CBM__c),sum(Actual_CBM__c) FROM clofor_com_cfs__Container_Info__c where clofor_com_cfs__HBL_SHIPMENT__c =:shipmentId GROUP BY P_O_No__c,Order_No__c,Style_No__c,Article_No__c];
        System.debug('1234:' + lstCon);
        for(AggregateResult agg:lstCon){
            sumCtns += (Decimal) agg.get('expr0');
            if(agg.get('expr1') != null && agg.get('expr1') != ''){
                sumWeight += (Decimal) agg.get('expr1');
            }
            if(agg.get('expr2') != null && agg.get('expr2') != ''){
                sumCBM += (Decimal) agg.get('expr2');
            }
            if(agg.get('expr3') != null && agg.get('expr3') != ''){
                sumActCBM += (Decimal) agg.get('expr3');
            }
        }
    }
    private clofor_com_cfs__CustomObject1__c getDataShipment(String strQueryShipment){
        clofor_com_cfs__CustomObject1__c ship = new clofor_com_cfs__CustomObject1__c();
        ship = Database.query(strQueryShipment);
        return ship;
    }

    private List<clofor_com_cfs__Container_Info__c> getDataCon(String setFieldCon){
        List<clofor_com_cfs__Container_Info__c> con = new List<clofor_com_cfs__Container_Info__c>();
        con = Database.query(strQueryCon);
        return con;
    } 

    private String stringQueryShipment(String shipmentId){
        String strSelect = 'SELECT ' + String.join(new List<String>(setFieldShipment), ',');
        String strFrom = ' FROM clofor_com_cfs__CustomObject1__c '; 
        String strWhere = 'WHERE Id = \'' + shipmentId + '\'' ;
        system.debug('1234:'+strSelect + strFrom+ strWhere);
        return strSelect + strFrom+ strWhere;
    }

}