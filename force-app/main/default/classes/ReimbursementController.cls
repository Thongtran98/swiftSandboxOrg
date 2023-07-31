public with sharing class ReimbursementController {
    public Reimbursement__c reim {get; set;}
    public List<clofor_com_cfs__MasterAnkenMeisai__c> listbill {get;set;}
    public List<clofor_com_cfs__Container_Info__c > listcon {get;set;}
    public List<clofor_com_cfs__MasterAnkenMeisai__c> arrResult {get;set;}

    public String strQueryReim {get;set;}
    public String strQueryBill {get;set;}
    public String strQueryCon {get;set;}
    public String reimID {get;set;}
    public String ReimNo {get;set;}
    public String customerName {get;set;}
    public Decimal SumAmount {get;set;}
    public String InformationDisplay {get; set;}

    private static Set<String> setFieldsBill = new Set<String>();
    private static Set<String> setFieldsReim = new Set<String>();
    private static Set<String> setFieldsCon = new Set<String>();

    static{
        setFieldsReim.add('S_O__r.clofor_com_cfs__Field1__r.Name');
        setFieldsReim.add('S_O__r.clofor_com_cfs__Field1__c');
        setFieldsReim.add('S_O__r.clofor_com_cfs__ID__c');
        setFieldsReim.add('S_O__r.clofor_com_cfs__JobRequestID__c');
        setFieldsReim.add('S_O__r.clofor_com_cfs__PrintDate__c');
        setFieldsReim.add('S_O__r.clofor_com_cfs__HBL_Number_SEA_AIR__c');
        setFieldsReim.add('S_O__r.clofor_com_cfs__ShipperEnglishCompanyName__c');
        setFieldsReim.add('S_O__r.clofor_com_cfs__Account_Cnee_Eng_name__c');
        setFieldsReim.add('S_O__r.clofor_com_cfs__ETA__c');
        setFieldsReim.add('S_O__r.clofor_com_cfs__Commodity_Type__c');
        setFieldsReim.add('S_O__r.clofor_com_cfs__A_O_D_CODE__c');
        setFieldsReim.add('S_O__r.clofor_com_cfs__A_O_A_CODE__c');
        setFieldsReim.add('S_O__r.clofor_com_cfs__weight__c');
        setFieldsReim.add('S_O__r.clofor_com_cfs__carton__c');
        setFieldsReim.add('S_O__r.clofor_com_cfs__UnitType__c');
        setFieldsReim.add('S_O__r.clofor_com_cfs__ETD__c');
        setFieldsReim.add('S_O__r.clofor_com_cfs__CBM__c');
        setFieldsReim.add('S_O__r.clofor_com_cfs__WkInitial__c');
        setFieldsReim.add('S_O__r.Name');
        setFieldsReim.add('S_O__r.clofor_com_cfs__Field1__r.clofor_com_cfs__EnglishAddress__c');
        setFieldsReim.add('S_O__r.clofor_com_cfs__HBL__c');
        setFieldsReim.add('S_O__r.clofor_com_cfs__Account_Shipper_Eng_name__c');
        setFieldsReim.add('S_O__r.clofor_com_cfs__Item__c');
        setFieldsReim.add('S_O__r.clofor_com_cfs__POL__r.Name');
        setFieldsReim.add('S_O__r.clofor_com_cfs__POD__r.Name');
        // setFieldsReim.add('Consignee_formula__c');
        setFieldsReim.add('MConsignee__c');
        setFieldsReim.add('shipper_formula__c');
        
        setFieldsReim.add('Invoice_to__c');
        setFieldsReim.add('Invoice_to__r.Name');
        setFieldsReim.add('Invoice_to__r.clofor_com_cfs__EnglishAddress__c');
        setFieldsReim.add('Invoice_to__r.Fax');
        setFieldsReim.add('Invoice_to__r.Phone');
        setFieldsReim.add('Name');
        setFieldsReim.add('Date_on_Reimbursement_form__c');
        setFieldsReim.add('File_No__c');
        setFieldsReim.add('Total_Amount__c');
        setFieldsReim.add('HBL_HAWB_No__c');
        setFieldsReim.add('H_ETA__c');
        setFieldsReim.add('HConsignee__c');
        setFieldsReim.add('HGrossWeight__c');
        setFieldsReim.add('HCommodity__c');
        setFieldsReim.add('H_P_O_L_A_O_D__c');
        setFieldsReim.add('H_P_O_D_A_O_A__c');
        setFieldsReim.add('HCargoQuantity__c');
        setFieldsReim.add('HCargoUnit__c');
        setFieldsReim.add('H_ETD__c');
        setFieldsReim.add('H_Measurement_Total_CBM__c');
        setFieldsReim.add('MBLMAWB_No__c');
        setFieldsReim.add('MShipper__c');
        setFieldsReim.add('MConsignee__c');
        setFieldsReim.add('M_ETA__c');
        setFieldsReim.add('MCommodityType__c');
        setFieldsReim.add('Gross_Weight__c');
        setFieldsReim.add('P_O_L_A_O_D__c');
        setFieldsReim.add('P_O_D_A_O_A__c');
        setFieldsReim.add('M_ETD__c');
        setFieldsReim.add('MCargo_Quantity__c');
        setFieldsReim.add('MCargoUnit__c');
        setFieldsReim.add('MMeasurement_Total_CBM__c');
        setFieldsReim.add('Total_Amount__c');
        setFieldsReim.add('Information_Display__c');
        setFieldsReim.add('Currency__c');
        setFieldsReim.add('Descriptionofgoods_Text__c');
        setFieldsReim.add('Border__c');
        setFieldsReim.add('M_Commodity__c');
    }
    static{
        setFieldsBill.add('clofor_com_cfs__BillNameAtPrintENG__c');
        setFieldsBill.add('clofor_com_cfs__Suryo__c');
        setFieldsBill.add('clofor_com_cfs__SellTankaUSD__c');
        setFieldsBill.add('AmountSellingIncludingTaxFCY__c');
    }
    static{
        setFieldsCon.add('clofor_com_cfs__Container_NO__c');
        setFieldsCon.add('clofor_com_cfs__Container__c');
    }
    public ReimbursementController() {
        reimID = ApexPages.currentPage().getParameters().get('id');

        reim = new Reimbursement__c();
        listbill = new List<clofor_com_cfs__MasterAnkenMeisai__c>();
        listcon = new List<clofor_com_cfs__Container_Info__c >();
        strQueryReim = '';
        strQueryBill = '';
        strQueryCon = '';
        ReimNo = '';
        customerName = '';
        SumAmount = 0;
        arrResult = new List<clofor_com_cfs__MasterAnkenMeisai__c>();


        strQueryReim = stringQueryShipment(reimID);
        strQueryBill = stringQueryBill(reimID);
        reim = Database.query(strQueryReim);
        String so = reim.S_O__c;
        if(so != null){
            strQueryCon = stringQueryCon(reim.S_O__c);
        }
        listbill = Database.query(strQueryBill);
        if(strQueryCon != ''){
            listcon = Database.query(strQueryCon);
        }
        System.debug('Thong debug :'+listbill);

        if(reim.Information_Display__c == '--None--'){
            InformationDisplay = 'NONE';
        }
        if(reim.Information_Display__c == 'House bill details'){
            InformationDisplay = 'HOUSE';
        }
        if(reim.Information_Display__c == 'Master bill details'){
            InformationDisplay = 'MASTER';
        }
        // clofor_com_cfs__CustomObject1__c ship = [
        //     SELECT clofor_com_cfs__WkInitial__c,
        //     Name
        //     FROM clofor_com_cfs__CustomObject1__c limit 1];
        
        //     ReimNo = 'S'+ship.clofor_com_cfs__WkInitial__c + ship.Name;

            

            // for (clofor_com_cfs__MasterAnkenMeisai__c bill : listbill) {
            //     SumAmount += bill.clofor_com_cfs__SellAmountUSD__c;
            // }
            Integer a = 0;
            if(listbill.size() < 10){
                a= 10- listbill.size();
            }

            for(Integer i = 0; i<=a;i++){
                clofor_com_cfs__MasterAnkenMeisai__c arr = new clofor_com_cfs__MasterAnkenMeisai__c();
                arrResult.add(arr);
            }

            
            
    }
    private String stringQueryShipment(String reimID){
        
        String strSelect = 'SELECT ' + String.join(new List<String>(setFieldsReim), ',');
        String strFrom = ' FROM Reimbursement__c ';
        String strWhere = 'WHERE Id = \'' + reimID + '\'' ;
        String strOrderBy = ' ORDER BY Name';
        return strSelect + strFrom + strWhere + strOrderBy;
    }

    private String stringQueryBill(String reimID){
        // clofor_com_cfs__CustomObject1__c bills2 = [SELECT clofor_com_cfs__Field1__c
        // FROM clofor_com_cfs__CustomObject1__c
        // WHERE Id =: reimID
        // ORDER By Name];

        // customerName = bills2.clofor_com_cfs__Field1__c;
        
        String strSelect = 'SELECT ' + String.join(new List<String>(setFieldsBill), ',');
        String strFrom = ' FROM clofor_com_cfs__MasterAnkenMeisai__c ';
        // String strWhere = 'WHERE Reimbursement_Record_ID__c = \'' + reimID + '\'' + ' AND Included_in_tax_invoice_selling__c = false' + ' AND clofor_com_cfs__Seikyusaki__c = \'' + customerName + '\'' ;
        String strWhere = 'WHERE Reimbursement_ID__c = \'' + reimID + '\'' ;
        String strOrderBy = ' ORDER BY Name';
        return strSelect + strFrom + strWhere + strOrderBy;
    }
    private String stringQueryCon(String reimID){
        
        String strSelect = 'SELECT ' + String.join(new List<String>(setFieldsCon), ',');
        String strFrom = ' FROM clofor_com_cfs__Container_Info__c  ';
        String strWhere = 'WHERE clofor_com_cfs__HBL_SHIPMENT__c = \'' + reimID + '\'' ;
        String strOrderBy = ' ORDER BY Name';
        return strSelect + strFrom + strWhere + strOrderBy;
    }
    
}