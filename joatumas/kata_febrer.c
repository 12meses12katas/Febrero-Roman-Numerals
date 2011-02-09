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

int main(int argc, char **argv){
	int num;
	int unit, five, dec, fifty, cent, fivehund, mil;
	char str_out[20];
	num = unit = dec = cent = mil = five = fifty = fivehund = str_out[0] = 0;
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
	//First, divide out the number into interesting divisors:
	mil = num / 1000;
	fivehund = (num % 1000)/500;
	cent = (num % 500)/100;
	fifty = (num % 100)/50;
	dec = (num % 50)/10;
	five = (num % 10)/5;
	unit = num%5;
	//Begin adding letters to the end of the string:
	add_letter('M', str_out, mil);
	if(cent == 4){
		add_letter('C', str_out, 1);
		if(fivehund)
			add_letter('M', str_out, 1);
		else
			add_letter('D', str_out, 1);
		cent = fivehund = 0;
	}
	add_letter('D', str_out, fivehund);
	add_letter('C', str_out, cent);
	if(dec == 4){
		add_letter('X', str_out, 1);
		if(fifty)
			add_letter('C', str_out, 1);
		else
			add_letter('L', str_out, 1);
		fifty = dec = 0;
	}
	add_letter('L', str_out, fifty);
	add_letter('X', str_out, dec);
	if(unit == 4){
		add_letter('I', str_out, 1);
		if(five)
			add_letter('X',str_out, 1);
		else
			add_letter('V',str_out, 1);
		five = unit = 0;
	}
	add_letter('V', str_out, five);
	add_letter('I', str_out, unit);
	printf("%s\n", str_out);
	exit(0);
}
