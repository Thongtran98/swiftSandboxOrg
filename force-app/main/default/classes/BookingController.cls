public with sharing class BookingController {

    public clofor_com_cfs__CustomObject1__c Booking{get;set;}
    public String BookingId{get;set;}
    private static Set<String> setFields = new Set<String>();
    public String strQuery {get; set;}
    public Decimal SumUnit {get; set;}
    public Decimal SumWeight {get; set;}
    public Decimal SumVolume {get; set;}

    static{
        setFields.add('Id');
        setFields.add('clofor_com_cfs__ADDRESS_ON_B_L__c');
        setFields.add('clofor_com_cfs__CNEE_ADDRESS_ON_B_L__c');
        setFields.add('clofor_com_cfs__NOTIFY_ADDRESS_ON_B_L__c');
        setFields.add('clofor_com_cfs__BookingDate__c');
        setFields.add('Cargo_Ready_Date__c');
        setFields.add('Document_Ready_Date__c');
        setFields.add('clofor_com_cfs__ETD__c');
        setFields.add('clofor_com_cfs__PriceTerms__c');
        setFields.add('clofor_com_cfs__LoadLocation__c');
        setFields.add('clofor_com_cfs__PlaceOfReceiptDetailPrint__c');
        setFields.add('clofor_com_cfs__PortOfLoadingDetailPrint__c	');
        setFields.add('clofor_com_cfs__PortOfDischargeDetailPrint__c');
        setFields.add('clofor_com_cfs__PlaceOfDeliveryDetailPrint__c');
        setFields.add('clofor_com_cfs__CARGO_TYPE__c');
        setFields.add('clofor_com_cfs__HouseBookingNo__c');
        setFields.add('clofor_com_cfs__Marks_and_Numbers__c');
        setFields.add('clofor_com_cfs__Item__c');
        setFields.add('clofor_com_cfs__carton__c');
        setFields.add('clofor_com_cfs__UnitType__c');
        setFields.add('clofor_com_cfs__weight__c');
        setFields.add('clofor_com_cfs__CBM__c');

    }

    public BookingController() {

        Booking = new clofor_com_cfs__CustomObject1__c();
        BookingId = '';
        SumUnit = 0;
        SumVolume = 0;
        SumWeight = 0;

        BookingId = ApexPages.currentPage().getParameters().get('id');
        strQuery = stringQueryBooking(BookingId);
        Booking = Database.query(strQuery);
        if(Booking.clofor_com_cfs__carton__c != null){
            SumUnit += Booking.clofor_com_cfs__carton__c;
        }
        if(Booking.clofor_com_cfs__weight__c != null){
            SumWeight += Booking.clofor_com_cfs__weight__c;
        }
        if(Booking.clofor_com_cfs__CBM__c != null){
            SumVolume += Booking.clofor_com_cfs__CBM__c;
        } 
    }

    private String stringQueryBooking(String BookingId){
        String strSelect = 'SELECT ' + String.join(new List<String>(setFields), ',');
        String strFrom = ' FROM clofor_com_cfs__CustomObject1__c ';
        String strWhere = 'WHERE Id = \'' + BookingId + '\'' ;
        String strOrderBy = ' ORDER BY Name LIMIT 1';
        return strSelect + strFrom + strWhere + strOrderBy;
    }
}