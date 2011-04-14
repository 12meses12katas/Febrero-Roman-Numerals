#include <stdio.h>

int romanTonum(char roman);

int main() {
	int result = romanTonum('C');
	printf("result: %d\n", result);
}

int romanTonum(char roman) {
	char romans[] = {'I', 'V' , 'X', 'L', 'C' ,'D','M'};
	int nums[] = {1, 5, 10, 50, 100, 500, 1000};

	int i, num = -1;
	for(i = 0; i < 7; i++) {
		if(roman == romans[i]) {
			num = nums[i];
			break;
		}
	}
	return num;
}
