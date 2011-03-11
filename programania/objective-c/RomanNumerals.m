#import "RomanNumerals.h"

@implementation RomanNumerals



- (NSString *) getCurrentRoman: (int) number {
	
	if (number == 4)  return @"IV";
	if (number == 9)  return @"IX";
	if (number < 4) return @"I";
	if (number < 9)  return @"V";
	return @"X";
	
}

- (int) getCurrentArabic: (int) number{
	
	if (number == 4) return 4;
	if (number == 9) return 9;
	if (number  < 4) return 1;
	if (number  < 9) return 5;
	return 10;
	
}

- (int) getArabicValue: (NSString *) current {
	
	if ([current isEqualTo: @"IV"]) return 4;
	if ([current isEqualTo: @"IX"]) return 9;
	if ( [current isEqualTo:@"I"] )return 1;
	if ( [current isEqualTo:@"V"] )return 5;
	if ( [current isEqualTo:@"X"] )return 10;
	
	return 0;
}

- (NSString *) getCurrent: (NSString *) roman {
	
	NSString * current;
	if ( [roman length ] > 1 ){
		current =  [roman substringToIndex:2];
		
		BOOL detecta = [current isEqualTo: @"IV"] || [current isEqualTo:@"IX"];
		
		if ( detecta )
			return current;
	}
	
	return [roman substringToIndex:1];
}

- (NSString *) arbicToRoman: (int) number {
	
	NSMutableString * result = [[NSMutableString alloc] initWithString: @""];
	
	while ( number > 0  ){		
		NSString * currentRoman = [self getCurrentRoman: number];
		int currentArabic = [self getCurrentArabic: number];
		[result appendString: currentRoman];
		number = number - currentArabic;
	}
	
	return result;
}

- (int) romanToArabic: (NSString * ) roman {
	
	int result = 0;
	
	while ( [roman length] > 0 ){
		
		NSString * current = [self getCurrent: roman ];
		
		result += [self getArabicValue: current];
		roman = [roman substringFromIndex: [current length] ];
	}
	
	return result;
}

@end
