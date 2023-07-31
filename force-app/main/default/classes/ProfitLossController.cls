public with sharing class ProfitLossController {
    public List<AggregateResult> lstbill {get; set;}
    public List<AggregateResult> lstbillDay {get; set;}
    public List<AggregateResult> lstbillYear {get; set;}
    public List<AggregateResult> lstbillWeek {get; set;}
    public List<AggregateResult> lstbillQuarter {get; set;}
    public List<AggregateResult > lstIncome {get; set;}
    public Set<AggregateResult > lstIncomeSet {get; set;}
    public List<AggregateResult> lstCost {get; set;}
    public List<AggregateResult> lstExpense {get; set;}
    public List<Datetime> listDate {get; set;}
    public Set<String> listMonth {get; set;}
    public Set<String> listMonthOfYear {get; set;}
    public List<String> listMonthOfYear2 {get; set;}
    public List<String> listMonth2 {get; set;}
    public Set<String> listYear {get; set;}
    public List<String> listYear2 {get; set;}
    public Set<String> listE {get; set;}
    public List<String> listE2 {get; set;}
    public Set<String> listWeek {get; set;}
    public Set<String> listWeekOfYear {get; set;}
    public List<String> listWeekOfYear2 {get; set;}
    public List<String> listWeek2 {get; set;}
    public Set<String> listQuarterOfYear {get; set;}
    public Set<String> listQuarter {get; set;}
    public List<String> listQuarterOfYear2 {get; set;}
    public List<String> listQuarter2 {get; set;}
    public Set<String> listIdChart {get; set;}
    public List<String> listIdChart2 {get; set;}
    

    // public List<ChartOfAccount> chartofacc {get;set;}
    public List<BillResufl> billresuflIncome {get;set;}
    public List<BillResufl> billresuflCost {get;set;}
    public List<BillResufl> billresuflRepense {get;set;}
    

    public String strQueryBill {get; set;}
    public String strQueryBillDay {get; set;}
    public String strQueryBillYear {get; set;}
    public String strQueryBillQuarter {get; set;}
    public String strQueryBillWeek {get; set;}
    public String ListTime {get; set;}
    public String strQueryIncome {get; set;}
    public String strQueryCost {get; set;}
    public String strQueryExpense {get; set;}
    public String selectedDate {get; set;}
    public String selectedColumn {get; set;}
    public String selectedSort {get; set;}
    public String dateFromText {get; set;}
    public String dateToText {get; set;}
    public String columnOptions2 {get; set;}
    public Date dateFrom {get; set;}
    public Date dateTo {get; set;}
    public Datetime dateFrom1 {get; set;}
    public Datetime UpdatedateFrom {get; set;}
    public Date printDate {get; set;}
    public Date firstDayOfMonth {get; set;}
    public Date weekStart {get; set;}
    public Date quarterStart {get; set;}
    public Date quarterEnd {get; set;}
    public Date lastweekStart {get; set;}
    public Date lastweekEnd {get; set;}
    public Date lastmonthStart {get; set;}
    public Date lastmonthEnd {get; set;}
    public Date lastyearStart {get; set;}
    public Date lastyearEnd {get; set;}
    public Date lastDayOfMonth {get; set;}
    public Date lastDayOfWeek {get; set;}
    public Date yearStart {get; set;}
    public Boolean showInput {get; set;}
    // public Datetime yearStart2 {get; set;}
    public Date Yesterday {get; set;}
    public Date Since30 {get; set;}
    public Date Since60 {get; set;}
    public Date Since90 {get; set;}
    public Datetime printDate1 {get; set;}
    public Integer numberDaysDue {get;set;}
    public Decimal countDate {get;set;}
    public List<Decimal> TotalIncome {get;set;}
    public List<Decimal> TotalCost {get;set;}
    public List<Decimal> TotalExpense {get;set;}
    public List<Decimal> GrossProfit {get;set;}
    public List<Decimal> NetOrdinary {get;set;}

    public Decimal IncomeTotal {get;set;}
    public Decimal CostTotal {get;set;}
    public Decimal ExpenseTotal {get;set;}
    public Decimal GrossTotal {get;set;}
    public Decimal NetTotal {get;set;}
    public Decimal tong {get;set;}

    // public String DayofWeek {get;set;}

    private static Set<String> setFieldsBill = new Set<String>();

    public ProfitLossController() {
        printDate = System.today();
        printDate1 = System.now();
        Datetime now = Datetime.now();
        Integer offset = UserInfo.getTimezone().getOffset(now);
        printDate1 = now.addSeconds(offset/1000);
        System.debug('123 :'+printDate1);
        IncomeTotal = 0; 
        CostTotal = 0; 
        ExpenseTotal = 0; 
        GrossTotal = 0; 
        NetTotal = 0;
        tong = 0;
        columnOptions2 = '';
        showInput = false;
        listDate = new List<Datetime>();
        listMonth = new Set<String>();
        listMonthOfYear = new Set<String>();
        listMonth2 = new List<String>();
        listMonthOfYear2 = new List<String>();
        listQuarter = new Set<String>();
        listQuarterOfYear = new Set<String>();
        listQuarter2 = new List<String>();
        listQuarterOfYear2 = new List<String>();
        listYear = new Set<String>();
        listYear2 = new List<String>();
        listE = new Set<String>();
        listE2 = new List<String>();
        listWeek = new Set<String>();
        listWeekOfYear = new Set<String>();
        listWeek2 = new List<String>();
        listWeekOfYear2 = new List<String>();
        // DayofWeek = '';
        dateFromText = String.valueOf(System.today());
        dateToText = String.valueOf(System.today());
        date myDate = date.today();
        weekStart = myDate.toStartofWeek();
        // date weekEnd = week_last_day(myDate);
        lastDayOfWeek = weekStart.addDays(6);
        firstDayOfMonth = myDate.toStartofMonth();
        lastDayOfMonth = firstDayOfMonth.addDays(Date.daysInMonth(firstDayOfMonth.year(), firstDayOfMonth.month()) - 1);
        yearStart = Date.valueOf(String.valueOf(myDate.year())+'-01-01');
        
        System.debug('yearStart :'+yearStart);
        Yesterday = Date.today().addDays(-1);
        lastweekEnd = weekStart.addDays(-1);
        lastweekStart = lastweekEnd.addDays(-6);
        lastmonthEnd = firstDayOfMonth.addDays(-1);
        lastmonthStart = lastmonthEnd.toStartofMonth();
        lastyearEnd = yearStart.addDays(-1);
        lastyearStart = Date.valueOf(String.valueOf(lastyearEnd.year())+'-01-01');
        Since30 = myDate.addDays(-30);
        Since60 = myDate.addDays(-60);
        Since90 = myDate.addDays(-90);
        Integer currentQtr = Decimal.valueOf(myDate.month()).divide(3.0, 0, System.RoundingMode.UP).intValue();
        Date datequarterStart1 = yearStart;
        Date datequarterEnd1 = yearStart.addDays(89);
        Date datequarterStart2 = datequarterEnd1.addDays(1);
        Date datequarterEnd2 = datequarterStart2.addDays(90);
        Date datequarterStart3 = datequarterEnd2.addDays(1);
        Date datequarterEnd3 = datequarterStart3.addDays(91);
        Date datequarterStart4 = datequarterEnd3.addDays(1);
        Date datequarterEnd4 = datequarterStart4.addDays(91);
        if(myDate.month() == 1 || myDate.month() == 2 || myDate.month() == 3){
            quarterStart = datequarterStart1;
            quarterEnd = datequarterEnd1;
        }
        if(myDate.month() == 4 || myDate.month() == 5 || myDate.month() == 6){
            quarterStart = datequarterStart2;
            quarterEnd = datequarterEnd2;
        }
        if(myDate.month() == 7 || myDate.month() == 8 || myDate.month() == 9){
            quarterStart = datequarterStart3;
            quarterEnd = datequarterEnd3;
        }
        if(myDate.month() == 10 || myDate.month() == 11 || myDate.month() == 12){
            quarterStart = datequarterStart4;
            quarterEnd = datequarterEnd4;
        }

        Date testTime = date.today().addMonths(6);
        Integer testInterger = getQuarterNumber(testTime);
        // String testString = testTime.format('w');
    }

    public static Integer getQuarterNumber(Datetime d) {
        if(d.month() >= 1 && d.month() <= 3)
            return 1;
        else if (d.month() >= 4 && d.month() <= 6)
            return 2;
        else if (d.month() >= 7 && d.month() <= 9)
            return 3;
        else 
            return 4;
    }
    
    public PageReference loadData(){
        dateFrom1 = Date.valueOf(ApexPages.currentPage().getParameters().get('dateFrom'));
        dateFrom = Date.valueOf(ApexPages.currentPage().getParameters().get('dateFrom'));
        columnOptions2 = ApexPages.currentPage().getParameters().get('selectedval');
        strQueryIncome = stringQueryIncomeType();
        strQueryCost = stringQueryCostType();
        strQueryExpense = stringQueryExpenseType();
        listDate = new List<Datetime>();
        listMonth = new Set<String>();
        listMonthOfYear = new Set<String>();
        listMonth2 = new List<String>();
        listMonthOfYear2 = new List<String>();
        listQuarter = new Set<String>();
        listQuarterOfYear = new Set<String>();
        listQuarter2 = new List<String>();
        listQuarterOfYear2 = new List<String>();
        listYear = new Set<String>();
        listYear2 = new List<String>();
        listWeek = new Set<String>();
        listWeekOfYear = new Set<String>();
        listWeek2 = new List<String>();
        listE = new Set<String>();
        listE2 = new List<String>();
        listWeekOfYear2 = new List<String>();
        lstIncome = new List<AggregateResult>();
        lstIncomeSet = new Set<AggregateResult>();
        listIdChart = new Set<String>();
        listIdChart2 = new List<String>();
        billresuflIncome = new List<BillResufl>();
        billresuflCost = new List<BillResufl>();
        billresuflRepense = new List<BillResufl>();
        countDate = 0; 
        IncomeTotal = 0; 
        CostTotal = 0; 
        ExpenseTotal = 0; 
        GrossTotal = 0; 
        NetTotal = 0;
        TotalIncome = new List<Decimal>();
        TotalCost = new List<Decimal>();
        TotalExpense = new List<Decimal>();
        GrossProfit = new List<Decimal>();
        NetOrdinary = new List<Decimal>();
        dateFrom = Date.valueOf(ApexPages.currentPage().getParameters().get('dateFrom'));
        dateTo = Date.valueOf(ApexPages.currentPage().getParameters().get('dateTo'));
        String day = String.valueOf(dateFrom.day()).leftpad(2, '0');
        String month = String.valueOf(dateFrom1.format('MMMM')).leftpad(2, '0');
        String year = String.valueOf(dateFrom.year()).leftpad(4, '0');
        dateFromText = ApexPages.currentPage().getParameters().get('dateFrom');
        String dayOfPrint = String.valueOf(printDate.day()).leftpad(2, '0');
        String monthOfPrint = String.valueOf(printDate1.format('MMMM')).leftpad(2, '0');
        String quaretrFrom = String.valueOf(convertQuarter(getQuarterNumber(dateFrom1)));
        String quarterTo = String.valueOf(convertQuarter(getQuarterNumber(printDate1)));
        String yearFrom = String.valueOf(dateFrom1.year()).leftpad(4, '0');
        String yearTo = String.valueOf(printDate1.year()).leftpad(4, '0');
        // yearStart2 = Date.valueOf(String.valueOf(dateFrom1.year())+'-01-01');
        // DayofWeek = String.valueOf(yearStart2.format('E'));
        if(columnOptions2 == 'Days'){
            ListTime = day + ' ' + month + ' ' + 'through' + ' ' + dayOfPrint + ' ' + monthOfPrint + ' '+ year;
        }
        else if(columnOptions2 == 'Months'){
            ListTime = month + ' '+ yearFrom + ' through ' + monthOfPrint + ' ' +yearTo;
        }
        else if(columnOptions2 == 'Quarters'){
            ListTime = quaretrFrom + ' '+ yearFrom + ' through ' + quarterTo + ' ' +yearTo;
        }
        else if(columnOptions2 == 'Years'){
            ListTime = yearFrom + ' through ' + yearTo;
        }
        else if(columnOptions2 == 'Customers'){
            showInput = true;
        }
        
    
        numberDaysDue = dateFrom.daysBetween(dateTo);
        Integer dateWeekStart = 0;
        Integer dateWeekEnd = 0;
        Datetime weekofStart;
        Datetime weekofEnd;
        lstIncome = Database.query(strQueryIncome);
        System.debug('lstIncome :'+lstIncome);
        lstCost = Database.query(strQueryCost);
        lstExpense = Database.query(strQueryExpense);
        for(Integer i = 0; i<= numberDaysDue; i++){
            UpdatedateFrom = dateFrom.addDays(i);
            if(UpdatedateFrom != null){
                listDate.add(UpdatedateFrom);
                listMonth.add(String.valueOf(UpdatedateFrom.month()));
                listMonthOfYear.add(String.valueOf(convertMonthNumberToText(Integer.valueOf(UpdatedateFrom.month()))+'-'+UpdatedateFrom.year()));
                listYear.add(String.valueOf(UpdatedateFrom.year()));
                listQuarter.add(String.valueOf(getQuarterNumber(UpdatedateFrom)));
                listQuarterOfYear.add(String.valueOf(convertQuarter(getQuarterNumber(UpdatedateFrom))+' '+UpdatedateFrom.year()));
                listWeek.add(String.valueOf(UpdatedateFrom.format('w')));
                listWeekOfYear.add(String.valueOf('Wee'+UpdatedateFrom.format('w')+'-'+UpdatedateFrom.year()));
                // listE.add(String.valueOf(UpdatedateFrom.format('E')));
                
                // dateWeekEnd = 7- dateWeekStart;
                // weekofStart = weekofEnd.addDays(1);
                // weekofEnd = weekofStart.addDays(dateWeekEnd);
                // listE.add(String.valueOf(weekofStart +'to'+weekofEnd));
            }
        }
        dateWeekStart = convertDateStringToNumber(String.valueOf(dateFrom1.format('E')));
                Integer j = 0;
                weekofStart = dateFrom1.addDays(-dateWeekStart+1);
                weekofEnd = weekofStart.addDays(6);
                listE2.add(String.valueOf(weekofStart.format('MMM-dd') +' To '+weekofEnd.format('MMM-dd')));
                while(weekofEnd <= dateTo){
                    weekofStart = weekofEnd.addDays(1);
                    weekofEnd = weekofStart.addDays(6);
                    listE2.add(String.valueOf(weekofStart.format('MMM-dd') +' To '+weekofEnd.format('MMM-dd')));
                }
        listE2.addAll(listE);
        // System.debug('listE :'+listE);
        System.debug('listE2 :'+listE2);
        System.debug('dateWeekStart :'+dateWeekStart);
        
        
        // listE2.addAll(listE);
        listMonth2.addAll(listMonth);
        listYear2.addAll(listYear);
        listWeek2.addAll(listWeek);
        listQuarter2.addAll(listQuarter);
        listMonthOfYear2.addAll(listMonthOfYear);
        listWeekOfYear2.addAll(listWeekOfYear);
        listQuarterOfYear2.addAll(listQuarterOfYear);
        countDate = listDate.size();
        strQueryBill = stringQueryBill();
        lstbill = Database.query(strQueryBill);
        strQueryBillDay = stringQueryBillDays();
        lstbillDay = Database.query(strQueryBillDay);
        strQueryBillYear = stringQueryBillYears();
        lstbillYear = Database.query(strQueryBillYear);
        strQueryBillQuarter = stringQueryBillQuarter();
        lstbillQuarter = Database.query(strQueryBillQuarter);
        strQueryBillWeek = stringQueryBillWeek();
        lstbillWeek = Database.query(strQueryBillWeek);
        System.debug('listQuarter2 :' +listQuarter2);
        System.debug('listQuarter :' +listQuarter);
        System.debug('lstbillWeek :'+lstbillWeek);
        // System.debug('listE2 :'+listE);
        // for(String testWeek : listWeek2 ){
        //     String dateWeekStart = String.valueOf(yearStart2.addDays(7*(Integer.valueOf(testWeek)-1))-Integer.valueOf(convertDateStringToNumber(DayofWeek))+1);
        //     String dateWeekEnd = String.valueOf(yearStart2.addDays(7*(Integer.valueOf(testWeek)-1)+7)-Integer.valueOf(convertDateStringToNumber(DayofWeek)));

        //     listE.add(String.valueOf(dateWeekStart + '-' + dateWeekEnd));
        // }
        // listE2.addAll(listE);
        // System.debug('listE2 :'+listE2);
        if(columnOptions2 == 'Weeks'){
            // -------------------Weeks Start--------------------------
    // Income
    for(AggregateResult  income : lstIncome){
        BillResufl billIncome = new BillResufl();
        billIncome.Name = (String)income.get('Chart_of_Accounts_Selling__c');
        billIncome.ChartName = (String)income.get('Name');
        if(!listIdChart.contains(String.valueOf(income.get('Chart_of_Accounts_Selling__c')))){
            listIdChart.add(String.valueOf(income.get('Chart_of_Accounts_Selling__c')));
            billresuflIncome.add(billIncome);
        }
        lstIncomeSet.add(income); 
    }
    System.debug('billresuflIncome :'+billresuflIncome);
    System.debug('12 :'+billresuflIncome);
    for(BillResufl bill :  billresuflIncome){
        for(String dateselect : listWeek2){
            Integer i = 0;
                    for(AggregateResult billarr : lstbillWeek){
                        if(i == 0){
                        if(dateselect == String.valueOf(billarr.get('expr2')) && bill.Name == String.valueOf(billarr.get('Chart_of_Accounts_Selling__c'))){
                                
                                bill.amounts.add((Decimal)billarr.get('expr0'));
                                i++;
                                bill.total += (Decimal)billarr.get('expr0');
                            }   
                        } 
                    }if(i == 0){
                        bill.amounts.add(0);
                        i++;
                    } 
                }
                System.debug('123123 :'+bill.amounts);
            }
            for(Integer i = 0; i< listWeek2.size(); i++){
                Decimal total = 0;
                for(BillResufl bill : billresuflIncome){ 
                   total += bill.amounts.get(i);
                   
                }
                TotalIncome.add(total); 
            }
            for(Decimal income : TotalIncome){
                IncomeTotal += income;
            }
            System.debug('debuggg22 :'+TotalIncome);
// COGS 

for(AggregateResult  cost : lstCost){
    BillResufl billCost = new BillResufl();
    billCost.Name = (String)cost.get('Chart_of_Accounts_Buying__c');
    billCost.ChartName = (String)cost.get('Name');

    billresuflCost.add(billCost);
}
    for(BillResufl bill :  billresuflCost){
        for(String dateselect : listWeek2){
            Integer i = 0;
                    for(AggregateResult billarr : lstbillWeek){
                        if(i == 0){
                        if(dateselect == String.valueOf(billarr.get('expr2')) && bill.Name == (String)billarr.get('Chart_of_Accounts_Buying__c')){
                                bill.amounts.add((Decimal)billarr.get('expr1'));
                                i++;
                                bill.total += (Decimal)billarr.get('expr1');
                            }   
                        }
                    }if(i == 0){
                        bill.amounts.add(0);
                        i++;
                    }  
                }
            }
            for(Integer i = 0; i< listWeek2.size(); i++){
                Decimal total = 0;
                for(BillResufl bill :  billresuflCost){ 
                   
                   total += bill.amounts.get(i);
                }
                TotalCost.add(total);
            } 
            for(Decimal cost : TotalCost){
                CostTotal += cost;
            }
// Expense

for(AggregateResult  ex : lstExpense){
    BillResufl billEx = new BillResufl();
    billEx.Name = (String)ex.get('Chart_of_Accounts_Buying__c');
    billEx.ChartName = (String)ex.get('Name');
    if(!listIdChart.contains(String.valueOf(ex.get('Chart_of_Accounts_Buying__c')))){
        listIdChart.add(String.valueOf(ex.get('Chart_of_Accounts_Buying__c')));
        billresuflRepense.add(billEx);
    }
}
System.debug('12 :'+billresuflRepense);
    for(BillResufl bill :  billresuflRepense){
        for(String dateselect : listWeek2){
            Integer i = 0;
                    for(AggregateResult billarr : lstbillWeek){
                        if(i == 0){
                        if(dateselect == String.valueOf(billarr.get('expr2')) && bill.Name == (String)billarr.get('Chart_of_Accounts_Buying__c')){
                                bill.amounts.add((Decimal)billarr.get('expr1'));
                                i++;
                                bill.total += (Decimal)billarr.get('expr1');
                            }   
                        }
                    }if(i == 0){
                        bill.amounts.add(0);
                        i++;
                    }  
                }
            } 
            for(Integer i = 0; i< listWeek2.size(); i++){
                Decimal total = 0;
                for(BillResufl bill :  billresuflRepense){ 
                   
                   total += bill.amounts.get(i);
                }
                TotalExpense.add(total);
            }
            for(Decimal cost : TotalExpense){
                ExpenseTotal += cost;
            }
    
for(Integer i = 0; i< listWeek2.size(); i++){
    GrossProfit.add(TotalIncome.get(i)-TotalCost.get(i));
    NetOrdinary.add(TotalIncome.get(i)-TotalCost.get(i)-TotalExpense.get(i));
}
for(Decimal gross : GrossProfit){
    GrossTotal += gross;
}
for(Decimal net : NetOrdinary){
    NetTotal += net;
}
}
// --------------------Weeks End---------------------------
        if(columnOptions2 == 'Quarters'){
            // -------------------Quarter Start--------------------------
    // Income
    for(AggregateResult  income : lstIncome){
        BillResufl billIncome = new BillResufl();
        billIncome.Name = (String)income.get('Chart_of_Accounts_Selling__c');
        billIncome.ChartName = (String)income.get('Name');
        if(!listIdChart.contains(String.valueOf(income.get('Chart_of_Accounts_Selling__c')))){
            listIdChart.add(String.valueOf(income.get('Chart_of_Accounts_Selling__c')));
            billresuflIncome.add(billIncome);
        }
        lstIncomeSet.add(income); 
    }
    System.debug('billresuflIncome :'+billresuflIncome);
    System.debug('12 :'+billresuflIncome);
    for(BillResufl bill :  billresuflIncome){
        for(String dateselect : listQuarter2){
            Integer i = 0;
                    for(AggregateResult billarr : lstbillQuarter){
                        if(i == 0){
                        if(dateselect == String.valueOf(billarr.get('expr2')) && bill.Name == String.valueOf(billarr.get('Chart_of_Accounts_Selling__c'))){
                                
                                bill.amounts.add((Decimal)billarr.get('expr0'));
                                i++;
                                bill.total += (Decimal)billarr.get('expr0');
                            }   
                        } 
                    }if(i == 0){
                        bill.amounts.add(0);
                        i++;
                    } 
                }
                System.debug('123123 :'+bill.amounts);
            }
            for(Integer i = 0; i< listQuarter2.size(); i++){
                Decimal total = 0;
                for(BillResufl bill : billresuflIncome){ 
                   total += bill.amounts.get(i);
                   
                }
                TotalIncome.add(total); 
            }
            for(Decimal income : TotalIncome){
                IncomeTotal += income;
            }
            System.debug('debuggg22 :'+TotalIncome);
// COGS 

for(AggregateResult  cost : lstCost){
    BillResufl billCost = new BillResufl();
    billCost.Name = (String)cost.get('Chart_of_Accounts_Buying__c');
    billCost.ChartName = (String)cost.get('Name');

    billresuflCost.add(billCost);
}
    for(BillResufl bill :  billresuflCost){
        for(String dateselect : listQuarter2){
            Integer i = 0;
                    for(AggregateResult billarr : lstbillQuarter){
                        if(i == 0){
                        if(dateselect == String.valueOf(billarr.get('expr2')) && bill.Name == (String)billarr.get('Chart_of_Accounts_Buying__c')){
                                bill.amounts.add((Decimal)billarr.get('expr1'));
                                i++;
                                bill.total += (Decimal)billarr.get('expr1');
                            }   
                        }
                    }if(i == 0){
                        bill.amounts.add(0);
                        i++;
                    }  
                }
            }
            for(Integer i = 0; i< listQuarter2.size(); i++){
                Decimal total = 0;
                for(BillResufl bill :  billresuflCost){ 
                   
                   total += bill.amounts.get(i);
                }
                TotalCost.add(total);
            } 
            for(Decimal cost : TotalCost){
                CostTotal += cost;
            }
// Expense

for(AggregateResult  ex : lstExpense){
    BillResufl billEx = new BillResufl();
    billEx.Name = (String)ex.get('Chart_of_Accounts_Buying__c');
    billEx.ChartName = (String)ex.get('Name');
    if(!listIdChart.contains(String.valueOf(ex.get('Chart_of_Accounts_Buying__c')))){
        listIdChart.add(String.valueOf(ex.get('Chart_of_Accounts_Buying__c')));
        billresuflRepense.add(billEx);
    }
}
System.debug('12 :'+billresuflRepense);
    for(BillResufl bill :  billresuflRepense){
        for(String dateselect : listQuarter2){
            Integer i = 0;
                    for(AggregateResult billarr : lstbillQuarter){
                        if(i == 0){
                        if(dateselect == String.valueOf(billarr.get('expr2')) && bill.Name == (String)billarr.get('Chart_of_Accounts_Buying__c')){
                                bill.amounts.add((Decimal)billarr.get('expr1'));
                                i++;
                                bill.total += (Decimal)billarr.get('expr1');
                            }   
                        }
                    }if(i == 0){
                        bill.amounts.add(0);
                        i++;
                    }  
                }
            } 
            for(Integer i = 0; i< listQuarter2.size(); i++){
                Decimal total = 0;
                for(BillResufl bill :  billresuflRepense){ 
                   
                   total += bill.amounts.get(i);
                }
                TotalExpense.add(total);
            }
            for(Decimal cost : TotalExpense){
                ExpenseTotal += cost;
            }
    
for(Integer i = 0; i< listQuarter2.size(); i++){
    GrossProfit.add(TotalIncome.get(i)-TotalCost.get(i));
    NetOrdinary.add(TotalIncome.get(i)-TotalCost.get(i)-TotalExpense.get(i));
}
for(Decimal gross : GrossProfit){
    GrossTotal += gross;
}
for(Decimal net : NetOrdinary){
    NetTotal += net;
}
}
// --------------------Quarter End---------------------------

        if(columnOptions2 == 'Years'){
            // -------------------Years Start--------------------------
    // Income
    for(AggregateResult  income : lstIncome){
        BillResufl billIncome = new BillResufl();
        billIncome.Name = (String)income.get('Chart_of_Accounts_Selling__c');
        billIncome.ChartName = (String)income.get('Name');
        if(!listIdChart.contains(String.valueOf(income.get('Chart_of_Accounts_Selling__c')))){
            listIdChart.add(String.valueOf(income.get('Chart_of_Accounts_Selling__c')));
            billresuflIncome.add(billIncome);
        }
        lstIncomeSet.add(income); 
    }
    System.debug('billresuflIncome :'+billresuflIncome);
System.debug('12 :'+billresuflIncome);
    for(BillResufl bill :  billresuflIncome){
        for(String dateselect : listYear2){
            Integer i = 0;
                    for(AggregateResult billarr : lstbillYear){
                        if(i == 0){
                        if(dateselect == String.valueOf(billarr.get('expr2')) && bill.Name == String.valueOf(billarr.get('Chart_of_Accounts_Selling__c'))){
                                
                                bill.amounts.add((Decimal)billarr.get('expr0'));
                                i++;
                                bill.total += (Decimal)billarr.get('expr0');
                            }   
                        } 
                    }if(i == 0){
                        bill.amounts.add(0);
                        i++;
                    } 
                }
                System.debug('123123 :'+bill.amounts);
            }
            for(Integer i = 0; i< listYear2.size(); i++){
                Decimal total = 0;
                for(BillResufl bill : billresuflIncome){ 
                   total += bill.amounts.get(i);
                   
                }
                TotalIncome.add(total); 
            }
            for(Decimal income : TotalIncome){
                IncomeTotal += income;
            }
            System.debug('debuggg22 :'+TotalIncome);
// COGS 

for(AggregateResult  cost : lstCost){
    BillResufl billCost = new BillResufl();
    billCost.Name = (String)cost.get('Chart_of_Accounts_Buying__c');
    billCost.ChartName = (String)cost.get('Name');

    billresuflCost.add(billCost);
}
    for(BillResufl bill :  billresuflCost){
        for(String dateselect : listYear2){
            Integer i = 0;
                    for(AggregateResult billarr : lstbillYear){
                        if(i == 0){
                        if(dateselect == String.valueOf(billarr.get('expr2')) && bill.Name == (String)billarr.get('Chart_of_Accounts_Buying__c')){
                                bill.amounts.add((Decimal)billarr.get('expr1'));
                                i++;
                                bill.total += (Decimal)billarr.get('expr1');
                            }   
                        }
                    }if(i == 0){
                        bill.amounts.add(0);
                        i++;
                    }  
                }
            }
            for(Integer i = 0; i< listYear2.size(); i++){
                Decimal total = 0;
                for(BillResufl bill :  billresuflCost){ 
                   
                   total += bill.amounts.get(i);
                }
                TotalCost.add(total);
            } 
            for(Decimal cost : TotalCost){
                CostTotal += cost;
            }
// Expense

for(AggregateResult  ex : lstExpense){
    BillResufl billEx = new BillResufl();
    billEx.Name = (String)ex.get('Chart_of_Accounts_Buying__c');
    billEx.ChartName = (String)ex.get('Name');
    if(!listIdChart.contains(String.valueOf(ex.get('Chart_of_Accounts_Buying__c')))){
        listIdChart.add(String.valueOf(ex.get('Chart_of_Accounts_Buying__c')));
        billresuflRepense.add(billEx);
    }
}
System.debug('12 :'+billresuflRepense);
    for(BillResufl bill :  billresuflRepense){
        for(String dateselect : listYear2){
            Integer i = 0;
                    for(AggregateResult billarr : lstbillYear){
                        if(i == 0){
                        if(dateselect == String.valueOf(billarr.get('expr2')) && bill.Name == (String)billarr.get('Chart_of_Accounts_Buying__c')){
                                bill.amounts.add((Decimal)billarr.get('expr1'));
                                i++;
                                bill.total += (Decimal)billarr.get('expr1');
                            }   
                        }
                    }if(i == 0){
                        bill.amounts.add(0);
                        i++;
                    }  
                }
            } 
            for(Integer i = 0; i< listYear2.size(); i++){
                Decimal total = 0;
                for(BillResufl bill :  billresuflRepense){ 
                   
                   total += bill.amounts.get(i);
                }
                TotalExpense.add(total);
            }
            for(Decimal cost : TotalExpense){
                ExpenseTotal += cost;
            }
    
for(Integer i = 0; i< listYear2.size(); i++){
    GrossProfit.add(TotalIncome.get(i)-TotalCost.get(i));
    NetOrdinary.add(TotalIncome.get(i)-TotalCost.get(i)-TotalExpense.get(i));
}
for(Decimal gross : GrossProfit){
    GrossTotal += gross;
}
for(Decimal net : NetOrdinary){
    NetTotal += net;
}
}
// --------------------Years End---------------------------
        if(columnOptions2 == 'Months'){
                // -------------------Months Start--------------------------
        // Income
        for(AggregateResult  income : lstIncome){
            BillResufl billIncome = new BillResufl();
            billIncome.Name = (String)income.get('Chart_of_Accounts_Selling__c');
            billIncome.ChartName = (String)income.get('Name');
            if(!listIdChart.contains(String.valueOf(income.get('Chart_of_Accounts_Selling__c')))){
                listIdChart.add(String.valueOf(income.get('Chart_of_Accounts_Selling__c')));
                billresuflIncome.add(billIncome);
            }
            lstIncomeSet.add(income); 
        }
        System.debug('billresuflIncome :'+billresuflIncome);
    System.debug('12 :'+billresuflIncome);
        for(BillResufl bill :  billresuflIncome){
            for(String dateselect : listMonth2){
                Integer i = 0;
                        for(AggregateResult billarr : lstbill){
                            if(i == 0){
                            if(dateselect == String.valueOf(billarr.get('expr2')) && bill.Name == String.valueOf(billarr.get('Chart_of_Accounts_Selling__c'))){
                                    
                                    bill.amounts.add((Decimal)billarr.get('expr0'));
                                    i++;
                                    bill.total += (Decimal)billarr.get('expr0');
                                }   
                            } 
                        }if(i == 0){
                            bill.amounts.add(0);
                            i++;
                        } 
                    }
                    System.debug('123123 :'+bill.amounts);
                }
                for(Integer i = 0; i< listMonth2.size(); i++){
                    Decimal total = 0;
                    for(BillResufl bill : billresuflIncome){ 
                       total += bill.amounts.get(i);
                       
                    }
                    TotalIncome.add(total); 
                }
                for(Decimal income : TotalIncome){
                    IncomeTotal += income;
                }
                System.debug('debuggg22 :'+TotalIncome);
    // COGS 
    
    for(AggregateResult  cost : lstCost){
        BillResufl billCost = new BillResufl();
        billCost.Name = (String)cost.get('Chart_of_Accounts_Buying__c');
        billCost.ChartName = (String)cost.get('Name');

        billresuflCost.add(billCost);
    }
        for(BillResufl bill :  billresuflCost){
            for(String dateselect : listMonth2){
                Integer i = 0;
                        for(AggregateResult billarr : lstbill){
                            if(i == 0){
                            if(dateselect == String.valueOf(billarr.get('expr2')) && bill.Name == (String)billarr.get('Chart_of_Accounts_Buying__c')){
                                    bill.amounts.add((Decimal)billarr.get('expr1'));
                                    i++;
                                    bill.total += (Decimal)billarr.get('expr1');
                                }   
                            }
                        }if(i == 0){
                            bill.amounts.add(0);
                            i++;
                        }  
                    }
                }
                for(Integer i = 0; i< listMonth2.size(); i++){
                    Decimal total = 0;
                    for(BillResufl bill :  billresuflCost){ 
                       
                       total += bill.amounts.get(i);
                    }
                    TotalCost.add(total);
                } 
                for(Decimal cost : TotalCost){
                    CostTotal += cost;
                }
    // Expense

    for(AggregateResult  ex : lstExpense){
        BillResufl billEx = new BillResufl();
        billEx.Name = (String)ex.get('Chart_of_Accounts_Buying__c');
        billEx.ChartName = (String)ex.get('Name');
        if(!listIdChart.contains(String.valueOf(ex.get('Chart_of_Accounts_Buying__c')))){
            listIdChart.add(String.valueOf(ex.get('Chart_of_Accounts_Buying__c')));
            billresuflRepense.add(billEx);
        }
    }
    System.debug('12 :'+billresuflRepense);
        for(BillResufl bill :  billresuflRepense){
            for(String dateselect : listMonth2){
                Integer i = 0;
                        for(AggregateResult billarr : lstbill){
                            if(i == 0){
                            if(dateselect == String.valueOf(billarr.get('expr2')) && bill.Name == (String)billarr.get('Chart_of_Accounts_Buying__c')){
                                    bill.amounts.add((Decimal)billarr.get('expr1'));
                                    i++;
                                    bill.total += (Decimal)billarr.get('expr1');
                                }   
                            }
                        }if(i == 0){
                            bill.amounts.add(0);
                            i++;
                        }  
                    }
                } 
                for(Integer i = 0; i< listMonth2.size(); i++){
                    Decimal total = 0;
                    for(BillResufl bill :  billresuflRepense){ 
                       
                       total += bill.amounts.get(i);
                    }
                    TotalExpense.add(total);
                }
                for(Decimal cost : TotalExpense){
                    ExpenseTotal += cost;
                }
        
    for(Integer i = 0; i< listMonth2.size(); i++){
        GrossProfit.add(TotalIncome.get(i)-TotalCost.get(i));
        NetOrdinary.add(TotalIncome.get(i)-TotalCost.get(i)-TotalExpense.get(i));
    }
    for(Decimal gross : GrossProfit){
        GrossTotal += gross;
    }
    for(Decimal net : NetOrdinary){
        NetTotal += net;
    }
}
    // --------------------Months End---------------------------
else if(columnOptions2 == 'Days'){
    // -------------------Days Start--------------------------
// Income
for(AggregateResult  income : lstIncome){
    BillResufl billIncome = new BillResufl();
    billIncome.Name = (String)income.get('Chart_of_Accounts_Selling__c');
    billIncome.ChartName = (String)income.get('Name');
    if(!listIdChart.contains(String.valueOf(income.get('Chart_of_Accounts_Selling__c')))){
        listIdChart.add(String.valueOf(income.get('Chart_of_Accounts_Selling__c')));
        billresuflIncome.add(billIncome);
    }
    
    lstIncomeSet.add(income);
    
}
System.debug('lstIncomeSet :'+lstIncomeSet);
System.debug('listIdChart :'+listIdChart);
System.debug('12 :'+billresuflIncome);
    for(BillResufl bill :  billresuflIncome){
        for(Datetime dateselect : listDate){
            Integer i = 0;
                    for(AggregateResult billarr : lstbillDay){
                        if(i == 0){
                        if(dateselect == (Date)billarr.get('AccountedDate__c') && bill.Name == (String)billarr.get('Chart_of_Accounts_Selling__c')){
                                bill.amounts.add((Decimal)billarr.get('expr0'));
                                i++;
                                bill.total += (Decimal)billarr.get('expr0');
                            }   
                        }
                        
                    }if(i == 0){
                        bill.amounts.add(0);
                        i++;
                    } 
                }
            }
            for(Integer i = 0; i< listDate.size(); i++){
                Decimal total = 0;
                for(BillResufl bill : billresuflIncome){ 
                   total += bill.amounts.get(i);
                   
                }
                TotalIncome.add(total); 
            }
            for(Decimal income : TotalIncome){
                IncomeTotal += income;
            }
            System.debug('debuggg22 :'+TotalIncome);
// COGS 

for(AggregateResult  cost : lstCost){
    BillResufl billCost = new BillResufl();
    billCost.Name = (String)cost.get('Chart_of_Accounts_Buying__c');
    billCost.ChartName = (String)cost.get('Name');
    if(!listIdChart.contains(String.valueOf(cost.get('Chart_of_Accounts_Buying__c')))){
        listIdChart.add(String.valueOf(cost.get('Chart_of_Accounts_Buying__c')));
        billresuflCost.add(billCost);
    }
}
System.debug('12 :'+billresuflCost);
    for(BillResufl bill :  billresuflCost){
        for(Datetime dateselect : listDate){
            Integer i = 0;
                    for(AggregateResult billarr : lstbillDay){
                        if(i == 0){
                        if(dateselect == (Date)billarr.get('AccountedDate__c') && bill.Name == (String)billarr.get('Chart_of_Accounts_Buying__c')){
                                bill.amounts.add((Decimal)billarr.get('expr1'));
                                i++;
                                bill.total += (Decimal)billarr.get('expr1');
                            }   
                        }
                    }if(i == 0){
                        bill.amounts.add(0);
                        i++;
                    }  
                }
                System.debug('debuggg :'+bill.amounts);
            }
            for(Integer i = 0; i< listDate.size(); i++){
                Decimal total = 0;
                for(BillResufl bill :  billresuflCost){ 
                   
                   total += bill.amounts.get(i);
                }
                TotalCost.add(total);
            } 
            for(Decimal cost : TotalCost){
                CostTotal += cost;
            }
            System.debug('debuggg22 :'+billresuflCost);
// Expense

for(AggregateResult  ex : lstExpense){
    BillResufl billEx = new BillResufl();
    billEx.Name = (String)ex.get('Chart_of_Accounts_Buying__c');
    billEx.ChartName = (String)ex.get('Name');
    if(!listIdChart.contains(String.valueOf(ex.get('Chart_of_Accounts_Buying__c')))){
        listIdChart.add(String.valueOf(ex.get('Chart_of_Accounts_Buying__c')));
        billresuflRepense.add(billEx);
    }
}
System.debug('12 :'+billresuflRepense);
    for(BillResufl bill :  billresuflRepense){
        for(Datetime dateselect : listDate){
            Integer i = 0;
                    for(AggregateResult billarr : lstbillDay){
                        if(i == 0){
                        if(dateselect == (Date)billarr.get('AccountedDate__c') && bill.Name == (String)billarr.get('Chart_of_Accounts_Buying__c')){
                                bill.amounts.add((Decimal)billarr.get('expr1'));
                                i++;
                                bill.total += (Decimal)billarr.get('expr1');
                            }   
                        }
                    }if(i == 0){
                        bill.amounts.add(0);
                        i++;
                    }  
                }
                System.debug('debuggg :'+bill.amounts.size());
            } 
            for(Integer i = 0; i< listDate.size(); i++){
                Decimal total = 0;
                for(BillResufl bill :  billresuflRepense){ 
                   
                   total += bill.amounts.get(i);
                }
                TotalExpense.add(total);
            }
            for(Decimal cost : TotalExpense){
                ExpenseTotal += cost;
            }
            System.debug('debuggg22 :'+billresuflRepense);
    
for(Integer i = 0; i< listDate.size(); i++){
    GrossProfit.add(TotalIncome.get(i)-TotalCost.get(i));
    NetOrdinary.add(TotalIncome.get(i)-TotalCost.get(i)-TotalExpense.get(i));
}
for(Decimal gross : GrossProfit){
    GrossTotal += gross;
}
for(Decimal net : NetOrdinary){
    NetTotal += net;
}
// --------------------Days End---------------------------
}
            return null;
}
        
    // public PageReference loadBill(){
        
    // }
    public List<SelectOption> getDateOptions() {
        List<SelectOption> dateOptions = new List<SelectOption>();
        dateOptions.add(new SelectOption('','-None-'));
        dateOptions.add(new SelectOption('Custom','Custom'));
        dateOptions.add(new SelectOption('Today','Today'));
        dateOptions.add(new SelectOption('This Week','This Week'));
        dateOptions.add(new SelectOption('This Month','This Month'));
        dateOptions.add(new SelectOption('This Quarter','This Quarter'));
        dateOptions.add(new SelectOption('This Year','This Year'));
        dateOptions.add(new SelectOption('Yesterday','Yesterday'));
        dateOptions.add(new SelectOption('Last Week','Last Week'));
        dateOptions.add(new SelectOption('Last Month','Last Month'));
        dateOptions.add(new SelectOption('Last Quarter','Last Quarter'));
        dateOptions.add(new SelectOption('Last Year','Last Year'));
        dateOptions.add(new SelectOption('Since 30 Days Ago','Since 30 Days Ago'));
        dateOptions.add(new SelectOption('Since 60 Days Ago','Since 60 Days Ago'));
        dateOptions.add(new SelectOption('Since 90 Days Ago','Since 90 Days Ago'));
        return dateOptions;
    }

    private static String convertMonthNumberToText(Integer matrixMonth){
        if(matrixMonth == 1){
            return 'Jan';   
        }else if(matrixMonth == 2){
            return 'Feb';   
        }else if(matrixMonth == 3){
            return 'Mar';   
        }else if(matrixMonth == 4){
            return 'Apr';   
        }else if(matrixMonth == 5){
            return 'May';       
        }else if(matrixMonth == 6){            
            return 'Jun';   
        }else if(matrixMonth == 7){
            return 'Jul';   
        }else if(matrixMonth == 8){
            return 'Aug';   
        }else if(matrixMonth == 9){
            return 'Sep';   
        }else if(matrixMonth == 10){
            return 'Oct';  
        }else if(matrixMonth == 11){
            return 'Nov';  
        }else{
            return 'Dec';
        }
    }
    private static Integer convertDateStringToNumber(String matrixDateString){
        if(matrixDateString == 'Mon'){
            return 2;   
        }else if(matrixDateString == 'Tue'){
            return 3;   
        }else if(matrixDateString == 'Wed'){
            return 4;   
        }else if(matrixDateString == 'Thu'){
            return 5;   
        }else if(matrixDateString == 'Fri'){
            return 6;       
        }else if(matrixDateString == 'Sat'){            
            return 7;   
        }else{
            return 1;   
        }
    }

    private static String convertQuarter(Integer matrixQuarter){
        if(matrixQuarter == 1){
            return 'Jan-Mar';   
        }else if(matrixQuarter == 2){
            return 'Apr-Jun';   
        }else if(matrixQuarter == 3){
            return 'Jul-Sep';   
        }else{
            return 'Oct-Dec';
        }
    }
    public PageReference saveonchange(){
        String dateOptions = ApexPages.currentPage().getParameters().get('value');
        System.debug('dateOptions :'+dateOptions);
        if(dateOptions == 'This Month'){
            dateFromText = String.valueOf(firstDayOfMonth);
            dateToText = String.valueOf(lastDayOfMonth);
        }
        if(dateOptions == 'This Week'){
            dateFromText = String.valueOf(weekStart);
            dateToText = String.valueOf(lastDayOfWeek);
        }
        if(dateOptions == 'Today'){
            dateFromText = String.valueOf(printDate);
            dateToText = String.valueOf(printDate);
        }
        if(dateOptions == 'Custom'){
            dateFromText = '';
            dateToText = '';
        }
        if(dateOptions == 'This Year'){
            dateFromText = String.valueOf(yearStart);
            dateToText = String.valueOf(printDate);
        }
        if(dateOptions == 'Yesterday'){
            dateFromText = String.valueOf(Yesterday);
            dateToText = String.valueOf(Yesterday);
        }
        if(dateOptions == 'Last Week'){
            dateFromText = String.valueOf(lastweekStart);
            dateToText = String.valueOf(lastweekEnd);
        }
        if(dateOptions == 'Last Month'){
            dateFromText = String.valueOf(lastmonthStart);
            dateToText = String.valueOf(lastmonthEnd);
        }
        if(dateOptions == 'Last Year'){
            dateFromText = String.valueOf(lastyearStart);
            dateToText = String.valueOf(lastyearEnd);
        }
        if(dateOptions == 'Since 30 Days Ago'){
            dateFromText = String.valueOf(Since30);
            dateToText = String.valueOf(printDate);
        }
        if(dateOptions == 'Since 60 Days Ago'){
            dateFromText = String.valueOf(Since60);
            dateToText = String.valueOf(printDate);
        }
        if(dateOptions == 'Since 90 Days Ago'){
            dateFromText = String.valueOf(Since90);
            dateToText = String.valueOf(printDate);
        }
        if(dateOptions == 'This Quarter'){
            dateFromText = String.valueOf(quarterStart);
            dateToText = String.valueOf(quarterEnd);
        }
        return null;
    }
    public List<SelectOption> getSortOptions() {
        List<SelectOption> sortOptions = new List<SelectOption>();
        sortOptions.add(new SelectOption('','-Default-'));
        sortOptions.add(new SelectOption('Custom','Custom'));
        sortOptions.add(new SelectOption('Today','Today'));
        sortOptions.add(new SelectOption('This Week','This Week'));
        sortOptions.add(new SelectOption('This Quarter','This Quarter'));
        sortOptions.add(new SelectOption('This Year','This Year'));
        sortOptions.add(new SelectOption('Yesterday','Yesterday'));
        sortOptions.add(new SelectOption('Last Week','Last Week'));
        sortOptions.add(new SelectOption('Last Month','Last Month'));
        sortOptions.add(new SelectOption('Last Quarter','Last Quarter'));
        sortOptions.add(new SelectOption('Last Year','Last Year'));
        sortOptions.add(new SelectOption('Since 30 Days Ago','Since 30 Days Ago'));
        sortOptions.add(new SelectOption('Since 60 Days Ago','Since 60 Days Ago'));
        sortOptions.add(new SelectOption('Since 90 Days Ago','Since 90 Days Ago'));
        
        return sortOptions;
    }
    public List<SelectOption> getColumnOptions() {
        List<SelectOption> columnOptions = new List<SelectOption>();
        columnOptions.add(new SelectOption('','-None-'));
        columnOptions.add(new SelectOption('Total Only','Total Only'));
        columnOptions.add(new SelectOption('Days','Days'));
        columnOptions.add(new SelectOption('Weeks','Weeks'));
        columnOptions.add(new SelectOption('Months','Months'));
        columnOptions.add(new SelectOption('Quarters','Quarters'));
        columnOptions.add(new SelectOption('Years','Years'));
        columnOptions.add(new SelectOption('Customers','Customers'));
        columnOptions.add(new SelectOption('Suppliers','Suppliers'));
        columnOptions.add(new SelectOption('Employees','Employees'));
        columnOptions.add(new SelectOption('Products/Services','Products/Services'));
        
        return columnOptions;
        }
    private String stringQueryBill(){
        String strSelect = 'SELECT SUM(AmountSellingIncludingTaxFCY__c),SUM(clofor_com_cfs__AmountBuyingIncludingTaxUSD__c),Chart_of_Accounts_Selling__r.Name, Chart_of_Accounts_Selling__c,Chart_of_Accounts_Buying__c,calendar_month(AccountedDate__c)';
        String strFrom = ' FROM clofor_com_cfs__MasterAnkenMeisai__c ';
        String strWhere = 'WHERE AccountedDate__c >=: dateFrom';
        String strOrderBy = ' GROUP BY Chart_of_Accounts_Selling__r.Name, Chart_of_Accounts_Selling__c,Chart_of_Accounts_Buying__c,calendar_month(AccountedDate__c)';
        
        return strSelect + strFrom + strWhere + strOrderBy; 
    }
    private String stringQueryBillDays(){
        String strSelect = 'SELECT SUM(AmountSellingIncludingTaxFCY__c),SUM(clofor_com_cfs__AmountBuyingIncludingTaxUSD__c),Chart_of_Accounts_Selling__r.Name, Chart_of_Accounts_Selling__c,Chart_of_Accounts_Buying__c,CALENDAR_MONTH(AccountedDate__c)';
        String strFrom = ' FROM clofor_com_cfs__MasterAnkenMeisai__c ';
        String strWhere = 'WHERE AccountedDate__c >=: dateFrom';
        String strOrderBy = ' GROUP BY Chart_of_Accounts_Selling__r.Name, Chart_of_Accounts_Selling__c,Chart_of_Accounts_Buying__c,CALENDAR_MONTH(AccountedDate__c) ORDER BY AccountedDate__c';
        
        return strSelect + strFrom + strWhere + strOrderBy; 
    }
    private String stringQueryBillYears(){
        String strSelect = 'SELECT SUM(AmountSellingIncludingTaxFCY__c),SUM(clofor_com_cfs__AmountBuyingIncludingTaxUSD__c),Chart_of_Accounts_Selling__r.Name, Chart_of_Accounts_Selling__c,Chart_of_Accounts_Buying__c,CALENDAR_YEAR(AccountedDate__c)';
        String strFrom = ' FROM clofor_com_cfs__MasterAnkenMeisai__c ';
        String strWhere = 'WHERE AccountedDate__c >=: dateFrom';
        String strOrderBy = ' GROUP BY Chart_of_Accounts_Selling__r.Name, Chart_of_Accounts_Selling__c,Chart_of_Accounts_Buying__c,CALENDAR_YEAR(AccountedDate__c)';
        
        return strSelect + strFrom + strWhere + strOrderBy; 
    }
    private String stringQueryBillQuarter(){
        String strSelect = 'SELECT SUM(AmountSellingIncludingTaxFCY__c),SUM(clofor_com_cfs__AmountBuyingIncludingTaxUSD__c),Chart_of_Accounts_Selling__r.Name, Chart_of_Accounts_Selling__c,Chart_of_Accounts_Buying__c,CALENDAR_QUARTER(AccountedDate__c)';
        String strFrom = ' FROM clofor_com_cfs__MasterAnkenMeisai__c ';
        String strWhere = 'WHERE AccountedDate__c >=: dateFrom';
        String strOrderBy = ' GROUP BY Chart_of_Accounts_Selling__r.Name, Chart_of_Accounts_Selling__c,Chart_of_Accounts_Buying__c,CALENDAR_QUARTER(AccountedDate__c)';
        
        return strSelect + strFrom + strWhere + strOrderBy; 
    }
    private String stringQueryBillWeek(){
        String strSelect = 'SELECT SUM(AmountSellingIncludingTaxFCY__c),SUM(clofor_com_cfs__AmountBuyingIncludingTaxUSD__c),Chart_of_Accounts_Selling__r.Name, Chart_of_Accounts_Selling__c,Chart_of_Accounts_Buying__c,WEEK_IN_YEAR(AccountedDate__c)';
        String strFrom = ' FROM clofor_com_cfs__MasterAnkenMeisai__c ';
        String strWhere = 'WHERE AccountedDate__c >=: dateFrom';
        String strOrderBy = ' GROUP BY Chart_of_Accounts_Selling__r.Name, Chart_of_Accounts_Selling__c,Chart_of_Accounts_Buying__c,WEEK_IN_YEAR(AccountedDate__c)';
        
        return strSelect + strFrom + strWhere + strOrderBy; 
    }
    private String stringQueryIncomeType(){
        String strSelect = 'SELECT Chart_of_Accounts_Selling__r.Name, Chart_of_Accounts_Selling__c,CALENDAR_MONTH(AccountedDate__c)';
        String strFrom = ' FROM clofor_com_cfs__MasterAnkenMeisai__c  ';
        String strWhere = ' WHERE Chart_of_Accounts_Selling__r.clofor_com_cfs__Type__c =\'Income\' AND Chart_of_Accounts_Selling__c != null AND AccountedDate__c >=: dateFrom' ;
        String strOrderBy = ' GROUP BY Chart_of_Accounts_Selling__r.Name, Chart_of_Accounts_Selling__c,CALENDAR_MONTH(AccountedDate__c)';
        return strSelect + strFrom + strWhere + strOrderBy;  
    }
    private String stringQueryCostType(){
        String strSelect = 'SELECT Chart_of_Accounts_Buying__r.Name, Chart_of_Accounts_Buying__c,CALENDAR_MONTH(AccountedDate__c)';
        String strFrom = ' FROM clofor_com_cfs__MasterAnkenMeisai__c ';
        String strWhere = 'WHERE Chart_of_Accounts_Buying__r.clofor_com_cfs__Type__c = \'Cost of Goods Sold\' AND Chart_of_Accounts_Buying__c != null AND AccountedDate__c >=: dateFrom';
        
        String strOrderBy = ' GROUP BY Chart_of_Accounts_Buying__r.Name, Chart_of_Accounts_Buying__c,CALENDAR_MONTH(AccountedDate__c)';
        return strSelect + strFrom + strWhere + strOrderBy;  
    }
    private String stringQueryExpenseType(){
        String strSelect = 'SELECT Chart_of_Accounts_Buying__r.Name, Chart_of_Accounts_Buying__c,CALENDAR_MONTH(AccountedDate__c)';
        String strFrom = ' FROM clofor_com_cfs__MasterAnkenMeisai__c ';
        String strWhere = 'WHERE Chart_of_Accounts_Buying__r.clofor_com_cfs__Type__c = \'Expense\' AND Chart_of_Accounts_Buying__c != null AND AccountedDate__c >=: dateFrom';
        
        String strOrderBy = ' GROUP BY Chart_of_Accounts_Buying__r.Name, Chart_of_Accounts_Buying__c,CALENDAR_MONTH(AccountedDate__c)';
        return strSelect + strFrom + strWhere + strOrderBy;  
    }

    // public class ChartOfAccount {
    //     public String Name {get;set;}
    //     public List<BillResufl> listBill {get;set;};
    //     public ChartOfAccount() {
    //         Name = '';
    //         listBill = new List<BillResufl>();

    //     }    
    // }
    public class BillResufl {
        public String Name {get;set;}
        public String ChartName {get;set;}
        public List<Decimal> amounts {get;set;}
        public List<Decimal> amountsMonth {get;set;}
        public Decimal total {get;set;}
        public BillResufl() {
            ChartName = '';
            Name = '';
            amounts = new List<Decimal>();
            amountsMonth = new List<Decimal>();
            total = 0;
        }    
    }
}