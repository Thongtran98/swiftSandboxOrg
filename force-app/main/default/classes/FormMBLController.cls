public with sharing class FormMBLController {
    public clofor_com_cfs__MasterAnken__c consol {get;set;}
    // public clofor_com_cfs__CustomObject1__c shipment {get;set;}
    public List<clofor_com_cfs__CustomObject1__c> listshipment {get;set;}
    public List<clofor_com_cfs__CustomObject1__c> listshipment2 {get;set;}
    public List<clofor_com_cfs__ConsolCNTR__c> listcon {get;set;}

    public String consolID {get; set;}
    public String strQuery {get; set;}
    public String strQueryShipment {get;set;}
    public String strQueryShipment2 {get;set;}
    public String strQueryCNTR {get;set;}
    public String ankenIds {get; set;}

    public static List<String> lstConsolIds = new List<String>();

    private static Set<String> setFieldsConsol = new Set<String>();
    private static Set<String> setFieldsShipment = new Set<String>();
    private static Set<String> setFieldsCNTR = new Set<String>();

    static{
        setFieldsConsol.add('clofor_com_cfs__MMaster_B_L_No__c');
        setFieldsConsol.add('Name');
        setFieldsConsol.add('clofor_com_cfs__Field1__r.Name');
        setFieldsConsol.add('clofor_com_cfs__MShipper__r.Name');
        setFieldsConsol.add('clofor_com_cfs__MCnee__r.Name');
        setFieldsConsol.add('clofor_com_cfs__MNotifyParty__r.Name');
        setFieldsConsol.add('clofor_com_cfs__MBookingNv__r.Name');
        setFieldsConsol.add('clofor_com_cfs__Line__r.Name');
        setFieldsConsol.add('clofor_com_cfs__MPOL__c');
        setFieldsConsol.add('clofor_com_cfs__METD__c');
        setFieldsConsol.add('clofor_com_cfs__META__c');
        setFieldsConsol.add('clofor_com_cfs__Autorollupcbm__c');
        setFieldsConsol.add('CreatedById');
        setFieldsConsol.add('clofor_com_cfs__MPOD__c');
        setFieldsConsol.add('clofor_com_cfs__rollupcargoquantity__c');
        setFieldsConsol.add('clofor_com_cfs__MPrintDate__c');
    }
    static{
        setFieldsShipment.add('clofor_com_cfs__HouseBookingNo__c');
        setFieldsShipment.add('Name');
        setFieldsShipment.add('Id');
        setFieldsShipment.add('clofor_com_cfs__shipper__r.Name');
        setFieldsShipment.add('clofor_com_cfs__Cnee__r.Name');
        setFieldsShipment.add('clofor_com_cfs__Field1__r.Name');
        setFieldsShipment.add('clofor_com_cfs__weight__c');
        setFieldsShipment.add('clofor_com_cfs__CBM__c');
        setFieldsShipment.add('clofor_com_cfs__Commodity_Type__c');
        setFieldsShipment.add('clofor_com_cfs__HBL__c');
        setFieldsShipment.add('clofor_com_cfs__carton__c');
        setFieldsShipment.add('clofor_com_cfs__CBM__c');
        setFieldsShipment.add('clofor_com_cfs__status__c');
        setFieldsShipment.add('clofor_com_cfs__ETA__c');
        setFieldsShipment.add('clofor_com_cfs__Marks_and_Numbers__c');
        setFieldsShipment.add('clofor_com_cfs__Gross_Weight__c');
        
    }
    static{
        setFieldsCNTR.add('clofor_com_cfs__ContainerNO__c');
        setFieldsCNTR.add('clofor_com_cfs__SealNo__c');
        setFieldsCNTR.add('clofor_com_cfs__ContainerType__c');
    }
    public FormMBLController() {
        ankenIds ='';
        
        // shipment = new clofor_com_cfs__CustomObject1__c();
        // ankenIds = ApexPages.currentPage().getParameters().get('ShipId');
        consol = new clofor_com_cfs__MasterAnken__c();
        listshipment = new List<clofor_com_cfs__CustomObject1__c>();
        listshipment2 = new List<clofor_com_cfs__CustomObject1__c>();
        consolID = ApexPages.currentPage().getParameters().get('id');
        strQuery = stringQueryConsol(consolID);
        strQueryShipment = stringQueryShipment(consolID);
        
        strQueryShipment2 = stringQueryShipment2(consolID);
        
        strQueryCNTR = stringQueryCNTR(consolID);
        consol = Database.query(strQuery);
        listshipment = Database.query(strQueryShipment);
        System.debug('2222222 :'+listshipment);
        listshipment2 = Database.query(strQueryShipment2);
        System.debug('1111111 :'+listshipment2);
        // shipment = Database.query(strQueryShipment);
        listcon = Database.query(strQueryCNTR);

        // ankenIds = ApexPages.currentPage().getParameters().get('ShipId');
        // System.debug('ankenIds: '+ankenIds);
        // if(ankenIds != null){
        //     so = ankenIds.split(',');
        //     System.debug('lstStringggggggg :'+so);
        // }
        
         
    }
    // public PageReference updateApex(){
    //     ankenIds = ApexPages.currentPage().getParameters().get('ShipId');
        
    //     String conID = ApexPages.currentPage().getParameters().get('id');
    //     List<String> lstConsolIds = new List<String>();
    //     if(!String.isBlank(ankenIds)){
    //         lstConsolIds = ankenIds.split(',');
    //         System.debug('123 :' + lstConsolIds );
    //     }
    //     String strSelect = 'SELECT ' + String.join(new List<String>(setFieldsShipment), ',');
    //     String strFrom = ' FROM clofor_com_cfs__CustomObject1__c ';
    //     String strWhere = 'WHERE clofor_com_cfs__MasterAnkenName__c = \'' + conID + '\'' ;
    //     if(lstConsolIds.size() > 0){
    //        strWhere += ' AND Id IN : lstConsolIds';
    //     }
    //     String strOrderBy = ' ORDER BY Name';
    //     String query = strSelect + strFrom + strWhere +strOrderBy;  
    //     listshipment = Database.query(query);
    //     System.debug('debugggggg :'+listshipment);
    //     for (clofor_com_cfs__CustomObject1__c ships : listshipment){
           
    //     }
        
    //     update listshipment;
    //     System.debug('Listtttt :'+listshipment);
    //     return null;
    // }   
    // public PageReference generateReport(){
    //     String ankenIds = ApexPages.currentPage().getParameters().get('ankenIds');
    //     System.debug('ankenIds: '+ankenIds);
    //     return null;
    // }
    private String stringQueryConsol(String consolId){
        String strSelect = 'SELECT ' + String.join(new List<String>(setFieldsConsol), ',');
        String strFrom = ' FROM clofor_com_cfs__MasterAnken__c ';
        String strWhere = 'WHERE Id = \'' + consolId + '\'' ;
        String strOrderBy = ' ORDER BY Name';
        return strSelect + strFrom + strWhere + strOrderBy;
    }
    private String stringQueryShipment(String consolId){
        
        String strSelect = 'SELECT ' + String.join(new List<String>(setFieldsShipment), ',');
        String strFrom = ' FROM clofor_com_cfs__CustomObject1__c ';
        String strWhere = 'WHERE clofor_com_cfs__MasterAnkenName__c = \'' + consolId + '\'' ;
        String strOrderBy = ' ORDER BY Name';
        return strSelect + strFrom + strWhere + strOrderBy;
    }
    private String stringQueryShipment2(String consolId){
        ankenIds = ApexPages.currentPage().getParameters().get('ShipId');
        // List<String> lstConsolIds = new List<String>();
        if(!String.isBlank(ankenIds)){
            lstConsolIds = ankenIds.split(',');
            System.debug('123 :' + lstConsolIds );
        }
        String strSelect = 'SELECT ' + String.join(new List<String>(setFieldsShipment), ',');
        String strFrom = ' FROM clofor_com_cfs__CustomObject1__c ';
        String strWhere = 'WHERE clofor_com_cfs__MasterAnkenName__c = \'' + consolId + '\'' ;
        if(lstConsolIds.size() > 0){
            strWhere += ' AND Id IN : lstConsolIds';
         }
        String strOrderBy = ' ORDER BY Name';
        return strSelect + strFrom + strWhere + strOrderBy;
    }
    private String stringQueryCNTR(String consolId){
        String strSelect = 'SELECT ' + String.join(new List<String>(setFieldsCNTR), ',');
        String strFrom = ' FROM clofor_com_cfs__ConsolCNTR__c ';
        String strWhere = 'WHERE clofor_com_cfs__Consolidation__c  = \'' + consolId + '\'' ;
        String strOrderBy = ' ORDER BY Name';
        return strSelect + strFrom + strWhere + strOrderBy;
    }
}