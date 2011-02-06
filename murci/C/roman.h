#ifndef __ROMAN_H__
#define __ROMAN_H__

#define ROMAN_MIN_LIMIT 1
#define ROMAN_MAX_LIMIT 3000

#define ERR_ROMAN_BADNUMBER -1
#define ERR_ROMAN_BADSTRING -2

char* itoroman(int value);
int romantoi(char* roman);

#endif /* __MONEY_H__ */
