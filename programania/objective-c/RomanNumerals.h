#import <Cocoa/Cocoa.h>


@interface RomanNumerals : NSObject {

}

- (NSString *) getCurrentRoman: (int) number; 

- (int) getCurrentArabic: (int) number;

- (int) getArabicValue: (NSString *) current ;

- (NSString *) getCurrent: (NSString *) roman ;

- (NSString *) arbicToRoman: (int) number ;

- (int) romanToArabic: (NSString * ) roman ;


@end
