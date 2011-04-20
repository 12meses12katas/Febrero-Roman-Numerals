#include <stdio.h>
#include <string.h>

char* numToroman(int num);
//int romanTonum(char *roman);
char *replace_str(char *str, char *orig, char *rep);
int getNum(char roman);
char getRoman(int num);

int main(void) {
	//int result = romanTonum('C');
	//printf("result: %d\n", result);
	
	
	int i;
	for(i = 1; i < 3000; i++) {
		char *result = numToroman(i);
		printf("resultado: %d = ", i);
		puts(result);
		printf("romando = %d\n", romanTonum(result));
		memset(result, '\0', sizeof( result ));
	}

	//printf("XXXIX = %d\n", romanTonum("XXXIX"));
	
	return 0;
}

char* numToroman(int parametro) {
	char romans[] = {'M', 'D', 'C', 'L', 'X', 'V', 'I'};
	int nums[] = {1000, 500, 100, 50, 10, 5, 1};
	static char resultado[15];
	//char resultado[15];
	int i;
	int tope = 0;
	//printf("parametro: %d  i:   tope: %d cociente: \n", parametro, tope);
	for(i = 0; i < 7; i++) {
		int cociente = parametro / nums[i];
		parametro = parametro - (cociente * nums[i]);
		//printf("parametro: %d  i: %d  tope: %d  cociente: %d\n", parametro, i, tope, cociente);
		while(cociente > 0) {
			//printf("entramos al while!\n");
			resultado[tope] = romans[i];
			//printf("resultado: %c  tope: %d  cociente: %d   i: %d\n", resultado[tope], tope, cociente, i);
			tope++;
			cociente--;
		}
	}
	resultado[tope] = '\0';
	char *result = replace_str(resultado, "IIII", "IV");
	result = replace_str(result, "VIV", "IX");
	result = replace_str(result, "XXXX", "XL");
	result = replace_str(result, "LXL", "XC");
	result = replace_str(result, "CCCC", "CD");
	result = replace_str(result, "DCD", "CM");

	return result;
}

int romanTonum(char *roman) {
	//char romans[] = {'I', 'V' , 'X', 'L', 'C' ,'D','M'};
	//int nums[] = {1, 5, 10, 50, 100, 500, 1000};

	int roman_invertido[strlen(roman)];
	int i;
	for(i = 0; i < strlen(roman); i++) {
		roman_invertido[i] = roman[strlen(roman)-1-i];
		//printf("i = %d   roman_invertido = %c\n",i, roman_invertido[i]);
	} 
	char mayor = 'I';
	int result = 0;

	for(i = 0; i < strlen(roman); i++) {
		if(getNum(mayor) <= getNum(roman_invertido[i])) {
			result = result + getNum(roman_invertido[i]);
			mayor = roman_invertido[i];
		} else {
			result = result - getNum(roman_invertido[i]);
		}
	}

	return result;
}

char *replace_str(char *str, char *orig, char *rep)
{
	static char buffer[4096];
	char *p;

	if(!(p = strstr(str, orig)))  // Chequeamos que orig se encuentre en str y p queda apuntando a orig
    		return str;

	strncpy(buffer, str, p-str); //Copiamos al buffer el contenido de str pero hasta la posicion que apunta p
	buffer[p-str] = '\0'; //le ponemos el caracter null para al final del buffer

	sprintf(buffer+(p-str), "%s%s", rep, p+strlen(orig));

	return buffer;
}

int getNum(char roman) {
	switch(roman) {
		case 'I':
			return 1;
		case 'V':
			return 5;
		case 'X':
			return 10;
		case 'L':
			return 50;
		case 'C':
			return 100;
		case 'D':
			return 500;
		case 'M':
			return 1000;
	}
}

char getRoman(int num) {
	switch(num) {
		case 1:
			return 'I';
		case 5:
			return 'V';
		case 10:
			return 'X';
		case 50:
			return 'L';
		case 100:
			return 'C';
		case 500:
			return 'D';
		case 1000:
			return 'M';
	}
}
