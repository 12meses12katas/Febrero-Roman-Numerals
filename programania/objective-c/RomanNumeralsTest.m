#import "RomanNumeralsTest.h"
#import "RomanNumerals.h";

@implementation RomanNumeralsTest


- (void) testRomanToArabic{

	RomanNumerals * rn = [[RomanNumerals alloc] init];
	
	STAssertEquals(1, [rn romanToArabic: @"I"], nil, nil);
	STAssertEquals(2, [rn romanToArabic: @"II"], nil, nil);
	STAssertEquals(3, [rn romanToArabic: @"III"], nil, nil);
	STAssertEquals(4, [rn romanToArabic: @"IV"], nil, nil);
	STAssertEquals(5, [rn romanToArabic: @"V"], nil, nil);
	STAssertEquals(6, [rn romanToArabic: @"VI"], nil, nil);
	STAssertEquals(7, [rn romanToArabic: @"VII"], nil, nil);
	STAssertEquals(8, [rn romanToArabic: @"VIII"], nil, nil);
	STAssertEquals(9, [rn romanToArabic: @"IX"], nil, nil);
	STAssertEquals(10, [rn romanToArabic: @"X"], nil, nil);
	STAssertEquals(11, [rn romanToArabic: @"XI"], nil, nil);
	STAssertEquals(12, [rn romanToArabic: @"XII"], nil, nil);
	STAssertEquals(13, [rn romanToArabic: @"XIII"], nil, nil);
	STAssertEquals(14, [rn romanToArabic: @"XIV"], nil, nil);
	STAssertEquals(15, [rn romanToArabic: @"XV"], nil, nil);
	STAssertEquals(16, [rn romanToArabic: @"XVI"], nil, nil);
	STAssertEquals(17, [rn romanToArabic: @"XVII"], nil, nil);
	STAssertEquals(18, [rn romanToArabic: @"XVIII"], nil, nil);
	STAssertEquals(19, [rn romanToArabic: @"XIX"], nil, nil);
	STAssertEquals(20, [rn romanToArabic: @"XX"], nil, nil);
	
}

-(void) testArabicToRoman {
	RomanNumerals * rn = [[RomanNumerals alloc] init];
	
	STAssertTrue ([@"I" isEqualToString:[rn arbicToRoman: 1]],nil,nil);
	STAssertTrue ([@"II" isEqualToString:[rn arbicToRoman: 2]],nil,nil);
	STAssertTrue ([@"III" isEqualToString:[rn arbicToRoman: 3]],nil,nil);
	STAssertTrue ([@"IV" isEqualToString:[rn arbicToRoman: 4]],nil,nil);
	STAssertTrue ([@"V" isEqualToString:[rn arbicToRoman: 5]],nil,nil);
	STAssertTrue ([@"VI" isEqualToString:[rn arbicToRoman: 6]],nil,nil);
	STAssertTrue ([@"VII" isEqualToString:[rn arbicToRoman: 7]],nil,nil);
	STAssertTrue ([@"VIII" isEqualToString:[rn arbicToRoman: 8]],nil,nil);
	STAssertTrue ([@"IX" isEqualToString:[rn arbicToRoman: 9]],nil,nil);
	STAssertTrue ([@"X" isEqualToString:[rn arbicToRoman: 10]],nil,nil);
	STAssertTrue ([@"XI" isEqualToString:[rn arbicToRoman: 11]],nil,nil);
	STAssertTrue ([@"XII" isEqualToString:[rn arbicToRoman: 12]],nil,nil);
	STAssertTrue ([@"XIII" isEqualToString:[rn arbicToRoman: 13]],nil,nil);
	STAssertTrue ([@"XIV" isEqualToString:[rn arbicToRoman: 14]],nil,nil);
	STAssertTrue ([@"XV" isEqualToString:[rn arbicToRoman: 15]],nil,nil);
	STAssertTrue ([@"XVI" isEqualToString:[rn arbicToRoman: 16]],nil,nil);
	STAssertTrue ([@"XVII" isEqualToString:[rn arbicToRoman: 17]],nil,nil);
	STAssertTrue ([@"XVIII" isEqualToString:[rn arbicToRoman: 18]],nil,nil);
	STAssertTrue ([@"XIX" isEqualToString:[rn arbicToRoman: 19]],nil,nil);
	STAssertTrue ([@"XX" isEqualToString:[rn arbicToRoman: 20]],nil,nil);
	
}


@end
