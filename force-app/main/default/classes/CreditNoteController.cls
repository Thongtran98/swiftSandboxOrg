public with sharing class CreditNoteController {
    public Credit_Note__c cre {get; set;}

    public List<clofor_com_cfs__MasterAnkenMeisai__c> listbill {get;set;}

    public List<clofor_com_cfs__MasterAnkenMeisai__c> arrResult {get;set;}

    public List<ResultWrapper> billResult {get; set;}

    public String strQueryCredit {get;set;}

    public String strQueryBill {get;set;}

    public String creID {get;set;}

    public String CreNo {get;set;}

    public String curr {get;set;}

    public String customerName {get;set;}

    public Decimal SumAmount {get;set;}

    public String InformationDisplay {get; set;}

    private static Set<String> setFieldsBill = new Set<String>();

    private static Set<String> setFieldsCredit = new Set<String>();

    static{
        setFieldsCredit.add('CreditNoteBelongTo__r.Name');
        setFieldsCredit.add('CreditNoteBelongTo__r.clofor_com_cfs__EnglishAddress__c');
        setFieldsCredit.add('CreditNoteBelongTo__r.Fax');
        setFieldsCredit.add('CreditNoteBelongTo__r.Phone');
        setFieldsCredit.add('Name');
        setFieldsCredit.add('Date__c');
        setFieldsCredit.add('FileNo__c');
        setFieldsCredit.add('Currency__c');
        setFieldsCredit.add('ShipmentID__r.clofor_com_cfs__HBL__c');
        setFieldsCredit.add('Shipper__c');
        setFieldsCredit.add('Consignee__c');
        setFieldsCredit.add('ETA__c');
        setFieldsCredit.add('DescriptionofGoods__c');
    }
    static{
        setFieldsBill.add('clofor_com_cfs__BillNameAtPrintENG__c');
        setFieldsBill.add('clofor_com_cfs__Suryo__c');
        setFieldsBill.add('clofor_com_cfs__SellTankaUSD__c');
        setFieldsBill.add('AmountSellingIncludingTaxFCY__c');
        setFieldsBill.add('clofor_com_cfs__BuyTankaUSD__c');
        setFieldsBill.add('clofor_com_cfs__BuyAmountJPN__c');
        setFieldsBill.add('clofor_com_cfs__BuyAmountUSD__c');
        setFieldsBill.add('clofor_com_cfs__BuyTankaJPY__c');
        setFieldsBill.add('clofor_com_cfs__BuyInTaxAmountJPY__c');
        setFieldsBill.add('clofor_com_cfs__AmountBuyingIncludingTaxUSD__c');
    }
    public CreditNoteController() {
        creID = ApexPages.currentPage().getParameters().get('id');

        cre = new Credit_Note__c();

        listbill = new List<clofor_com_cfs__MasterAnkenMeisai__c>();

        billResult = new List<ResultWrapper>();

        strQueryCredit = '';

        strQueryBill = '';

        SumAmount = 0;

        curr = '';

        arrResult = new List<clofor_com_cfs__MasterAnkenMeisai__c>();

        strQueryCredit = stringQueryCredit(creID);

        strQueryBill = stringQueryBill(creID);

        cre = Database.query(strQueryCredit);

        curr = cre.Currency__c;

        listbill = Database.query(strQueryBill);

        billResult = getDataBill(strQueryBill);
        
        Integer a = 0;
            if(listbill.size() < 10){
                a= 10- listbill.size();
            }

            for(Integer i = 0; i<=a;i++){
                clofor_com_cfs__MasterAnkenMeisai__c arr = new clofor_com_cfs__MasterAnkenMeisai__c();
                arrResult.add(arr);
            }
        
            // for(clofor_com_cfs__MasterAnkenMeisai__c bill : listbill){
            //     SumAmount += bill.AmountSellingIncludingTaxFCY__c;
            // }
            // System.debug('123 :'+SumAmount);
    }

    private List<ResultWrapper> getDataBill(String strQueryy){
        List<ResultWrapper> results = new List<ResultWrapper>();
        List<clofor_com_cfs__MasterAnkenMeisai__c> lstBill = new List<clofor_com_cfs__MasterAnkenMeisai__c>();
        lstBill = Database.query(strQueryy);

        For (clofor_com_cfs__MasterAnkenMeisai__c bill: lstBill){
            ResultWrapper item = new ResultWrapper();
            item.Desciption = bill.clofor_com_cfs__BillNameAtPrintENG__c;
            item.Qty = bill.clofor_com_cfs__Suryo__c;
            if(curr == 'KHR'){
                item.Rate = bill.clofor_com_cfs__BuyTankaJPY__c;
                item.Amount = bill.clofor_com_cfs__BuyInTaxAmountJPY__c;
                SumAmount += bill.clofor_com_cfs__BuyInTaxAmountJPY__c;
            }else {
                item.Rate = bill.clofor_com_cfs__BuyTankaUSD__c;
                item.Amount = bill.clofor_com_cfs__AmountBuyingIncludingTaxUSD__c;
                SumAmount += bill.clofor_com_cfs__AmountBuyingIncludingTaxUSD__c;
            }
            results.add(item);
        }
        return results;
    }

    private String stringQueryCredit(String creID){
        
        String strSelect = 'SELECT ' + String.join(new List<String>(setFieldsCredit), ',');
        String strFrom = ' FROM Credit_Note__c ';
        String strWhere = 'WHERE Id = \'' + creID + '\'' ;
        String strOrderBy = ' ORDER BY Name';
        return strSelect + strFrom + strWhere + strOrderBy;
    }

    private String stringQueryBill(String creID){
        String strSelect = 'SELECT ' + String.join(new List<String>(setFieldsBill), ',');
        String strFrom = ' FROM clofor_com_cfs__MasterAnkenMeisai__c ';
        String strWhere = 'WHERE Credit_NoteNo__c = \'' + creID + '\'' ;
        String strOrderBy = ' ORDER BY Name';
        return strSelect + strFrom + strWhere + strOrderBy;
    }

    public class ResultWrapper{
        public clofor_com_cfs__MasterAnkenMeisai__c bill {get; set;}
        public String Desciption {get;set;}
        public Decimal Qty {get;set;}
        public Decimal Rate {get;set;}
        public Decimal Amount {get;set;}
        public ResultWrapper(){
            this.bill = new clofor_com_cfs__MasterAnkenMeisai__c();
            this.Desciption = '';
            this.Qty = 0;
            this.Rate = 0;
            this.Amount = 0;
        }
    }
}