public with sharing class AddMultipleQuoteLineController {
    @AuraEnabled
    public static void saveQuoteLineList(List<clofor_com_cfs__QuoteLine__c> quoteLineList,Id quoteId) 
	{  
        AggregateResult numberQuote = [SELECT MAX(clofor_com_cfs__QuoteLineNumber__c) FROM clofor_com_cfs__QuoteLine__c where clofor_com_cfs__QuoteID__c =:quoteId];
        Integer numMax = Integer.valueOf(numberQuote.get('expr0'));
        System.debug('1234:' + numMax);
        if(String.isBlank(String.valueOf(numMax))){
            numMax = 0;
        }
        for(clofor_com_cfs__QuoteLine__c quoLine: quoteLineList){
            System.debug('1234:'+numberQuote);
            quoLine.clofor_com_cfs__QuoteID__c = quoteId;
            if(quoLine.clofor_com_cfs__Unit__c != null){
                quoLine.clofor_com_cfs__Unit__c = quoLine.clofor_com_cfs__Unit__c;
                System.debug('1234:' + quoLine.clofor_com_cfs__Unit__c);
            }
            System.debug('1234:'+numMax);
            quoLine.clofor_com_cfs__QuoteLineNumber__c = Integer.valueOf(Integer.valueOf(numMax)+1);
            numMax++;
        }
        Insert quoteLineList;
        System.debug('1234:' + quoteLineList);
    }
}