#include <stdio.h>
#include <stdlib.h>

/*                    Letter Histogram
Student Name: Chris Turner
Date: 1-24-2015

ECE 2035 Homework 2-1

This program computes and displays a letter usage histogram in a text file.

(This is the only file that should be modified for the C implementation
of Homework 2.)

*/
void		LetterHistogram(FILE *);

int main(int argc, char *argv[]) {
   FILE		*FP;

   if (argc != 2) {
     printf("usage: %s valuefile\n", argv[0]);
     exit(1);
   }
   FP = fopen(argv[1], "r");
   if (FP == NULL) {
      printf("%s could not be opened; check the filename\n", argv[1]);
      exit(1);
   } else {
      LetterHistogram(FP);
      fclose(FP);
      exit(0);
   }
}

/* This routine counts the frequency of letters in a text file. The final
   count is used to print a letter usage histogram. */

void LetterHistogram(FILE *FP) {

   /* your code goes here and should include the printf statements below */
	int carr[256] = {0};
	int l;
	int total = 0;
	int x;
	double p;
	while ((l = fgetc(FP))) {
		if (l == EOF) break;
			if ((l > 64) & (l < 91)) {
			carr[l] += 1;
			total += 1;
			}
			if ((l > 96) & (l < 123)) {
			carr[l -32] += 1;
			total += 1;
			}
	}
	/*printf("Total %d", total);*/
	printf("Letter Occurrence Histogram\n");
	for (x = 65; x < 91 ;x++) {
		
			p =  ((float) carr[x] / total) * 100;
			printf("[%c] %6d, %4.1f%%\n", x, carr[x], p);
		
	} 

   
     /* complete and use this print statement in a loop
        to print the stats for each letter:  

     printf("[%c] %5d, %4.1f%%\n",   ,  ,  )

      */

	


     
}
