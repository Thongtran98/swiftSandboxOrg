public with sharing class VATINVController {
    public static void onAfterInsertUpdateDelete(List<clofor_com_cfs__VAT_INVOICE__c> oldListVATINV, List<clofor_com_cfs__VAT_INVOICE__c> newListVATINV){
        for(clofor_com_cfs__VAT_INVOICE__c vat: newListVATINV){
            if(vat.Amount_Selling_incl_Tax_FCY_Formula__c != null){
                vat.clofor_com_cfs__AmountVATSellingInclVATText__c = EnglishNumberToWords.convert(vat.Amount_Selling_incl_Tax_FCY_Formula__c);
            }else{
                vat.clofor_com_cfs__AmountVATSellingInclVATText__c = '';
            }
        }
    }
}