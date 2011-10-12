$(document).ready(function(){
	  
	  
	  module("Simple tests");
	  
	  test("1",function(){ok(Numbers.test(1,"I"))});
      test("4",function(){ok(Numbers.test(4,"IV"))});
      test("5",function(){ok(Numbers.test(5,"V"))});
      test("9",function(){ok(Numbers.test(9,"IX"))});
      test("10",function(){ok(Numbers.test(10,"X"))});
      test("40",function(){ok(Numbers.test(40,"XL"))});
      test("50",function(){ok(Numbers.test(50,"L"))});
      test("90",function(){ok(Numbers.test(90,"XC"))});
      test("C",function(){ok(Numbers.test(100,"C"))});
      test("CD",function(){ok(Numbers.test(400,"CD"))});
      test("D",function(){ok(Numbers.test(500,"D"))});
      test("CM",function(){ok(Numbers.test(900,"CM"))});
      test("M",function(){ok(Numbers.test(1000,"M"))});
      
        module("Tens tests");
    
      test("11",function(){ok(Numbers.test(11,"XI"))});
      test("12",function(){ok(Numbers.test(12,"XII"))});
      test("13",function(){ok(Numbers.test(13,"XIII"))});
      test("14",function(){ok(Numbers.test(14,"XIV"))});
      test("19",function(){ok(Numbers.test(19,"XIX"))});
      test("20",function(){ok(Numbers.test(20,"XX"))});
      test("24",function(){ok(Numbers.test(24,"XXIV"))});
      test("31",function(){ok(Numbers.test(31,"XXXI"))});
      test("37",function(){ok(Numbers.test(38,"XXXVIII"))});
      test("45",function(){ok(Numbers.test(45,"XLV"))});
      test("71",function(){ok(Numbers.test(71,"LXXI"))});
      test("87",function(){ok(Numbers.test(87,"LXXXVII"))});
      test("99",function(){ok(Numbers.test(99,"XCIX"))});
        
		module("Hundreds tests");
      test("109",function(){ok(Numbers.test(109,"CIX"))});
      test("203",function(){ok(Numbers.test(203,"CCIII"))});
      test("303",function(){ok(Numbers.test(303,"CCCIII"))});
      test("304",function(){ok(Numbers.test(304,"CCCIV"))});
      test("450",function(){ok(Numbers.test(450,"CDL"))});
      test("546",function(){ok(Numbers.test(546,"DXLVI"))});
      test("671",function(){ok(Numbers.test(671,"DCLXXI"))});
      test("788",function(){ok(Numbers.test(788,"DCCLXXXVIII"))});
      test("888",function(){ok(Numbers.test(888,"DCCCLXXXVIII"))});
      test("999",function(){ok(Numbers.test(999,"CMXCIX"))});
        
		module("Thousands tests");
      test("1010",function(){ok(Numbers.test(1010,"MX"))});
      test("1111",function(){ok(Numbers.test(1111,"MCXI"))});
      test("1234",function(){ok(Numbers.test(1234,"MCCXXXIV"))});
      test("2342",function(){ok(Numbers.test(2342,"MMCCCXLII"))});
      test("2999",function(){ok(Numbers.test(2999,"MMCMXCIX"))});

  });
