@isTest
public class EnglishNumberToWordsTest {
    public static testMethod void checkEnglishNumberToWords() {
    Test.startTest();
      
    String num4 = EnglishNumberToWords.convert(4.00);    
    System.assertEquals('FOUR USD ONLY',num4);
        
    String num = EnglishNumberToWords.convert(79550.00);    
    System.assertEquals('SEVENTY NINE THOUSAND FIVE HUNDRED FIFTY USD ONLY',num);
    
    String num1 = EnglishNumberToWords.convert(775.34);    
    System.assertEquals('SEVEN HUNDRED SEVENTY FIVE USD AND THIRTY FOUR CENTS',num1);   
        
    String num2 = EnglishNumberToWords.convert(127374955.34);    
    System.assertEquals('ONE HUNDRED TWENTY SEVEN MILION THREE HUNDRED SEVENTY FOUR THOUSAND NINE HUNDRED FIFTY FIVE USD AND THIRTY FOUR CENTS',num2);
        
    String num3 = EnglishNumberToWords.convert(1277491427571.34);    
    System.assertEquals('TWELVE HUNDRED SEVENTY SEVEN BILION FOUR HUNDRED NINETY ONE MILION FOUR HUNDRED TWENTY SEVEN THOUSAND FIVE HUNDRED SEVENTY ONE USD AND THIRTY FOUR CENTS',num3);
        
    Test.stopTest();
    }
}