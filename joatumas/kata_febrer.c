#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//Adds n letters to the end of a string
int add_letter(char letter, char *out_str, int n){
	int len = strlen(out_str);
	int i;
	for(i = 0; i<n; i++)
		out_str[len+i] = letter;
	out_str[len + i] = 0;
	return(len + i);
}

int numeral_to_roman(int num, char *str_out){
	int i;
	char symbols[7] = {'M','D', 'C', 'L', 'X', 'V', 'I'};
	int divided_num[7];
	//First, divide out the number into interesting divisors:
	divided_num[0] = num / 1000; //1000
	divided_num[1] = (num % 1000)/500; //500
	divided_num[2] = (num % 500)/100; //100
	divided_num[3] = (num % 100)/50;//50
	divided_num[4] = (num % 50)/10;//10
	divided_num[5] = (num % 10)/5;//5
	divided_num[6] = num%5;//1
	//Begin adding letters to the end of the string:
	add_letter(symbols[0], str_out, divided_num[0]);
	for(i=1; i<7; i = i+2){
		if(divided_num[i+1] == 4){
			add_letter(symbols[i+1], str_out, 1);
			if(divided_num[i])
				add_letter(symbols[i-1], str_out, 1);
			else
				add_letter(symbols[i], str_out, 1);
			divided_num[i] = divided_num[i+1] = 0;
		}
		add_letter(symbols[i], str_out, divided_num[i]);
		add_letter(symbols[i+1], str_out, divided_num[i+1]);
	}
	return(0);
}

int main(int argc, char **argv){
	int num;
	char str_out[20];
	str_out[0] = 0;
	if(argc != 2){
		fprintf(stderr,"ERROR: Wrong arg numbers\n\tUSAGE: %s number\n", argv[0]);
		exit(-1);
	}
	num = atoi(argv[1]);
	if(num<0){
		fprintf(stderr,"ERROR: Please, insert a positive number\n");
		exit(-1);
	}else if(num>3000){
		fprintf(stderr,"ERROR: Please, do NOT exceed the number 3000\n");
		exit(-1);
	}
	numeral_to_roman(num, str_out);
	printf("%s\n", str_out);
	exit(0);
}
