// Main program for gtDisplay graphical interface
// George F. Riley, Georgia Tech, Spring 2015

#include <iostream>
#include <stdlib.h>
#include <math.h>

#include "gtDisplay.h"


int main(int argc, char** argv)
{
    
    int testNum = 1;
    
    if (argc > 1) testNum = atol(argv[1]);
    std::cout << "Running test number " << testNum << std::endl;
    gtDisplayInit(argc, argv);
    int i;
    int h;		//Variable declaration


    gtWindow origWindow = gtLoadImage("TechTowerSign.jpg");	//Load image of tech tower into origWindow.
    int wtower = gtGetWidth(origWindow);
    int htower = gtGetHeight(origWindow);
    int dtower = gtGetDepth(origWindow);			//Retrieving the geometry of the window.
    uint32_t* origPixelArray = gtGet32BitPixels(origWindow);	//Greate pointer to the first item in the picture array.
    
    
    gtWindow inverWindow  = gtCreateBlankWindow(wtower, htower, dtower);	//New window for the inverted image.
    uint32_t* inverPixelArray = gtGet32BitPixels(inverWindow);			//Pointer to inverted pixel array.
    origPixelArray = origPixelArray + htower*wtower - wtower; 		// Set new position of the orig array to the bottom row.

    
    for ( h = 0; h < htower; h++) {		//Iterrate through the rows of the image.
	for ( i = 0; i < wtower; i++) {		//Iterrate through each pixel along the width of the image.
		*inverPixelArray = *origPixelArray;	//Set the conents(pixels) equal to each other. Bottom row of orig becomes top row of inverted.
		origPixelArray++;		//move the pointer to the next pixel.
		inverPixelArray++;		//move the pointer to the next pixel.
		
	}
	origPixelArray = origPixelArray - 2*wtower;	//Move the original pointer two rows up, to the row previous to the copied row.
    }
    
    gtUpdate(inverWindow);
    
    gtWindow bwWindow  = gtCreateBlankWindow(wtower, htower, 8);
    uint8_t* bwPixelArray = gtGet8BitPixels(bwWindow);			//Pointer to new window for BW photo.
    origPixelArray = gtGet32BitPixels(origWindow);			//Reseting pointer of the origPixelARray

    for ( i = 0; i < htower*wtower; i++){	//Move through every pixel in the image.
	uint8_t origRed =  gtGetRed(*origPixelArray);
	uint8_t origGreen = gtGetGreen(*origPixelArray);
	uint8_t origBlue = gtGetBlue(*origPixelArray);		//Grab the three color pieces of the given pixel.
	int bwPix = int(floor((origRed + origGreen + origBlue)/3));		//Average the pixels taking the floor value.
	*bwPixelArray = bwPix;		//Set the BW window pixel to the given averaged 8bit pixel.
	origPixelArray++;		//Move to next Pixel
	bwPixelArray++;			//Move to next pixel.
	}

    
    
    gtWindow wagonWindow = gtCreateBlankWindow(512, 512, 32);
	
	 


    gtRun();
    
}


