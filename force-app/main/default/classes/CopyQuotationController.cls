global with sharing class CopyQuotationController {
	webService static String cloneFullQuotation(String quoteIdSource){
		return cloneFull(quoteIdSource); 
	}
	@AuraEnabled
	public static String cloneFull(String quoteIdSource){
		clofor_com_cfs__Quote__c quoteSource = getQuoteSource(quoteIdSource);
		clofor_com_cfs__Quote__c quoteDestination = quoteSource.clone(false);
		quoteDestination.clofor_com_cfs__SubmissionTargetDate__c = null;
		quoteDestination.clofor_com_cfs__QuoteIssueDate__c = null;
		quoteDestination.clofor_com_cfs__ValidTo__c = null;

		List<clofor_com_cfs__QuoteLine__c> quoteLineItems = getListQuoteLineSource(quoteIdSource);
		List<clofor_com_cfs__ProdSvcPricingQuoteLine__c> pricingLineItems = getListPricingQuoteLine(quoteIdSource);
		Map<Id, clofor_com_cfs__QuoteLine__c> mapQuoteLinebyIdSource = new  Map<Id, clofor_com_cfs__QuoteLine__c>();

		FlsService.doInsert(quoteDestination);
		for(clofor_com_cfs__QuoteLine__c item : quoteLineItems){
			clofor_com_cfs__QuoteLine__c itemClone = item.clone(false);
			itemClone.clofor_com_cfs__QuoteID__c = quoteDestination.Id;
			mapQuoteLinebyIdSource.put(item.Id, itemClone);
		}

		FlsService.doInsert(mapQuoteLinebyIdSource.values());
		List<clofor_com_cfs__ProdSvcPricingQuoteLine__c> pricingLineItemsClone = new List<clofor_com_cfs__ProdSvcPricingQuoteLine__c>();
		for(clofor_com_cfs__ProdSvcPricingQuoteLine__c pricingItem : pricingLineItems ){
			clofor_com_cfs__ProdSvcPricingQuoteLine__c pricingItemClone = pricingItem.clone(false);

			if(mapQuoteLinebyIdSource.containsKey(pricingItem.clofor_com_cfs__QuoteLineID__c)){
				pricingItemClone.clofor_com_cfs__QuoteLineID__c = mapQuoteLinebyIdSource.get(pricingItem.clofor_com_cfs__QuoteLineID__c).Id;
			}
			pricingLineItemsClone.add(pricingItemClone);
		}

		FlsService.doInsert(pricingLineItemsClone);
		return quoteDestination.Id; 

	}
	private static clofor_com_cfs__Quote__c getQuoteSource(String quoteIdSource){
		clofor_com_cfs__Quote__c quoteSource = [SELECT Id, 
        clofor_com_cfs__BuyingAmountInclTaxLocal__c, clofor_com_cfs__BuyingAmountInclTaxUSD__c, clofor_com_cfs__AmountInclTaxLocal__c,
        clofor_com_cfs__AmountInclTaxUSD__c, clofor_com_cfs__AmountOfTaxLocal__c, clofor_com_cfs__AmountOfTaxUSD__c, clofor_com_cfs__AmountOfTaxBuyingLocal__c,
        clofor_com_cfs__AmountOfTaxBuyingUSD__c, clofor_com_cfs__CargoMode__c, clofor_com_cfs__CarrierVendor__c, clofor_com_cfs__Condition__c, clofor_com_cfs__ContainerType__c,
        clofor_com_cfs__CntrTypeQnty__c, clofor_com_cfs__DeliveryAddress__c, clofor_com_cfs__DescriptionOfGoods__c, clofor_com_cfs__ETA__c, clofor_com_cfs__ETD__c, clofor_com_cfs__ExchangeRateID__c,
        clofor_com_cfs__ExternalSales__c, clofor_com_cfs__Frequency__c, clofor_com_cfs__FXRateID__c, clofor_com_cfs__GrossWeightKG__c, clofor_com_cfs__Incoterms__c, clofor_com_cfs__MeasurementCBM__c,
        clofor_com_cfs__NetWeightKG__c, clofor_com_cfs__PICOfRequesterCompany__c, clofor_com_cfs__PODAOA__c, clofor_com_cfs__POLAOD__c, clofor_com_cfs__ParentQuoteID__c, clofor_com_cfs__PaymentCondition__c,
        clofor_com_cfs__PickupAddress__c, clofor_com_cfs__ProfitInclTaxLocal__c, clofor_com_cfs__ProfitIncludeTaxUSD__c, clofor_com_cfs__ProfitNICTaxLocal__c, clofor_com_cfs__ProfitNICTaxUSD__c,
        clofor_com_cfs__ProfitRatioInclTaxLocal__c, clofor_com_cfs__ProfitRatioInclTaxUSD__c, clofor_com_cfs__ProfitRatioNICTaxLocal__c,
        clofor_com_cfs__ProfitRatioNICTaxUSD__c, clofor_com_cfs__Quantity__c, clofor_com_cfs__QuoteIssueDate__c, clofor_com_cfs__QuoteName__c,
        clofor_com_cfs__QuoteNumber__c, clofor_com_cfs__QuotePIC__c, clofor_com_cfs__QuoteStatus__c, clofor_com_cfs__Remarks__c,
        clofor_com_cfs__RequestDetail__c,clofor_com_cfs__RequesterCompany__c, clofor_com_cfs__RFPRFQID__c, clofor_com_cfs__SubmissionTargetDate__c,
        clofor_com_cfs__TargetRate__c, clofor_com_cfs__TotalAmountLocal__c, clofor_com_cfs__TotalAmountUSD__c, clofor_com_cfs__TotalAmountBuyingLocal__c,
        clofor_com_cfs__TotalAmountBuyingUSD__c, clofor_com_cfs__Unit__c, clofor_com_cfs__ValidTo__c, clofor_com_cfs__VesselFlight__c, clofor_com_cfs__Volume__c, RecordTypeId
					FROM clofor_com_cfs__Quote__c
					WHERE Id =: quoteIdSource];
		return quoteSource;
	}

	private static List<clofor_com_cfs__QuoteLine__c> getListQuoteLineSource(String quoteIdSource){
		List<clofor_com_cfs__QuoteLine__c> quoteLineItems = [SELECT Id, clofor_com_cfs__Over1000kg__c, clofor_com_cfs__Over100kg__c, clofor_com_cfs__Over300kg__c, clofor_com_cfs__Over45kg__c, clofor_com_cfs__Over500kg__c,
        clofor_com_cfs__Under45kg__c, clofor_com_cfs__AmountOfBuyingTaxLocal__c, clofor_com_cfs__AmountOfBuyingTaxUSD__c,
        clofor_com_cfs__AmountOfSellingTaxLocal__c, clofor_com_cfs__AmountOfSellingTaxUSD__c, clofor_com_cfs__BuyingAmountInclTaxLocal__c,
        clofor_com_cfs__BuyingAmountInclTaxUSD__c, clofor_com_cfs__BuyingListPriceLocal__c, clofor_com_cfs__BuyingListPriceUSD__c, clofor_com_cfs__CarrierAirlinerVendor__c, 
        clofor_com_cfs__CarrierAirlinerVendorName__c, clofor_com_cfs__ContainerQuantity__c, clofor_com_cfs__ContainerType__c, clofor_com_cfs__CurrencyBuying__c, clofor_com_cfs__CurrencyConverseForBuying__c,
        clofor_com_cfs__CurrencyConverseForSelling__c, clofor_com_cfs__CurrencySelling__c, clofor_com_cfs__DeliveryAddress__c, clofor_com_cfs__ExchangeRateBuyingUpdate__c,
        clofor_com_cfs__ExchangeRateSelling__c, clofor_com_cfs__ExchangeRateSellingUpdate__c, clofor_com_cfs__FSCSCS__c, clofor_com_cfs__FXRateID__c, clofor_com_cfs__LineItemDescription__c, 
        clofor_com_cfs__LineItemName__c, clofor_com_cfs__Minimum__c, clofor_com_cfs__PODAOA__c, clofor_com_cfs__PODAOAName__c, clofor_com_cfs__POLAOD__c, clofor_com_cfs__POLAODName__c, clofor_com_cfs__ParentQuoteLine__c, clofor_com_cfs__PickupAddress__c,
        clofor_com_cfs__Print__c, clofor_com_cfs__PrintingSection__c, clofor_com_cfs__ProductID__c, clofor_com_cfs__Quantity__c, clofor_com_cfs__QuoteID__c, clofor_com_cfs__QuoteLineNumber__c, clofor_com_cfs__Remarks__c,
        clofor_com_cfs__SellingAmountInclTaxLocal__c, clofor_com_cfs__SellingAmountInclTaxUSD__c, clofor_com_cfs__DiscountRate__c, clofor_com_cfs__SellingListPriceLocal__c, 
        clofor_com_cfs__SellingListPriceUSD__c, clofor_com_cfs__ServiceCategory__c, clofor_com_cfs__ServiceCostingType__c, clofor_com_cfs__ServicePricingID__c, clofor_com_cfs__ServiceSchedule__c,
        clofor_com_cfs__ServiceSubCategory__c, clofor_com_cfs__ExchangeRateBuying__c, clofor_com_cfs__TaxRateBuying__c, clofor_com_cfs__TaxRate__c, clofor_com_cfs__TotalAmountBuyingLocal__c, clofor_com_cfs__TotalAmountOfBuyingUSD__c,
        clofor_com_cfs__TotalAmountSellingLocal__c, clofor_com_cfs__TotalAmountOfSellingUSD__c, clofor_com_cfs__TransitTimeDays__c, clofor_com_cfs__Unit__c, RecordTypeId
								FROM clofor_com_cfs__QuoteLine__c 
								WHERE clofor_com_cfs__QuoteID__c =: quoteIdSource];
		return quoteLineItems;
	}

	private static List<clofor_com_cfs__ProdSvcPricingQuoteLine__c> getListPricingQuoteLine(String quoteIdSource){
		List<clofor_com_cfs__ProdSvcPricingQuoteLine__c> pricingLineItems = [SELECT Id, clofor_com_cfs__deletedSvcSellingUnitPriceLocal__c, clofor_com_cfs__ProdPricingID__c,
        clofor_com_cfs__ProdBuyingUnitPriceLocal__c, clofor_com_cfs__ProdBuyingUnitPriceUSD__c, clofor_com_cfs__ProdSellingUnitPriceLocal__c,
        clofor_com_cfs__ProdSellingUnitPriceUSD__c, clofor_com_cfs__QuoteLineID__c, clofor_com_cfs__QuoteLineRollupStatus__c, clofor_com_cfs__SvcBuyingUnitPriceLocal__c, 
        clofor_com_cfs__SvcBuyingUnitPriceUSD__c, clofor_com_cfs__SvcPricingID__c, clofor_com_cfs__SvcSellingUnitPriceLocal__c, clofor_com_cfs__SvcSellingUnitPriceUSD__c
															FROM clofor_com_cfs__ProdSvcPricingQuoteLine__c
															WHERE clofor_com_cfs__QuoteLineID__r.clofor_com_cfs__QuoteID__c =: quoteIdSource];
		return pricingLineItems;
	}
}