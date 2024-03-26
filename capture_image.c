// #include "address_map_arm.h"
#include <time.h>
#define KEY_BASE              0xFF200050
#define VIDEO_IN_BASE         0xFF203060
#define FPGA_ONCHIP_BASE      0xC8000000

#define BLACK_PIXEL 0x0000
#define WHITE_PIXEL 0xFFFF

/* This program demonstrates the use of the D5M camera with the DE1-SoC Board
 * It performs the following: 
 * 	1. Capture one frame of video when any key is pressed.
 * 	2. Display the captured frame when any key is pressed.		  
*/
/* Note: Set the switches SW1 and SW2 to high and rest of the switches to low for correct exposure timing while compiling and the loading the program in the Altera Monitor program.
*/

//Functions
void timestamp(volatile short *imagePtr);
void mirror(volatile short *imagePtr);
void convertBnW(volatile short *imagePtr);
void invertPixels(volatile short *imagePtr);

int main(void)
{
	volatile int * KEY_ptr				= (int *) KEY_BASE;
	volatile int * Video_In_DMA_ptr	= (int *) VIDEO_IN_BASE;
	volatile short * Video_Mem_ptr	= (short *) FPGA_ONCHIP_BASE;

	int x, y;
	int count = 0;
	
	*(Video_In_DMA_ptr + 3)	= 0x4;				// Enable the video
	
	while(1) { // while loop to keep to go back to the video after getting image

		while (1)
		{
			if (*KEY_ptr != 0)						// check if any KEY was pressed
			{
				count++;
				*(Video_In_DMA_ptr + 3) = 0x0;			// Disable the video to capture one frame
				while (*KEY_ptr != 0);				// wait for pushbutton KEY release
				break;
			}
		}

        	if (count == 1) {
			mirror(Video_Mem_ptr); // first image will be mirrored
            		
        	}else if(count == 2) {
			convertBnW(Video_Mem_ptr); // second image will be turn Black and white
        	}else if (count == 3) {
            		
			invertPixels(Video_Mem_ptr); // third image will be reverse of Black and White
        	}else if(count == 4){
            		
			timestamp(Video_Mem_ptr); // fourth image will display the time stamp

            }else if(count == 5) { // on fifth button click it will reset the count to do again and get rid of the time stamp 
			count = 0;
    		int offset;
			char *text_ptr;
			text_ptr = "                                                                   "; //used as empty to remove time stamp
    		/* Write the timestamp onto the image */
    		offset = (1 << 7) + 30;
   			while (*(text_ptr)) {
            /* Write the character onto the image */
        		*(char*)(0xC9000000 + offset) = *(text_ptr);
            /* Move to the next character in the timestamp string */
        		text_ptr++;
            /* Move to the next pixel position */
        		offset++;
			}
		}

		while (1)
		{
			if (*KEY_ptr != 0)						// check if any KEY was pressed
			{	
				*(Video_In_DMA_ptr + 3) = 0x4; // once button is pressed after image is shown the video will resume
				while (*KEY_ptr != 0);
				break;
			}
		}
	}
	// unchanged
	for (y = 0; y < 240; y++) {
		for (x = 0; x < 320; x++) {
			short temp2 = *(Video_Mem_ptr + (y << 9) + x);
			*(Video_Mem_ptr + (y << 9) + x) = temp2;
		}
	}


	return 0;
}

// Add timestamp function
void timestamp(volatile short *imagePtr) {
    int offset;
    char *text_ptr;

    time_t t = time(NULL);
    struct tm *tm = localtime(&t);
    text_ptr = asctime(tm);

    /* Write the timestamp onto the image */
    offset = (1 << 7) + 30;
    while (*(text_ptr)) {
        /* Write the character onto the image */
        *(char*)(0xC9000000 + offset) = *(text_ptr);

        /* Move to the next character in the timestamp string */
        text_ptr++;

        /* Move to the next pixel position */
        offset++;

    }
}


// Flip and mirror function
void mirror(volatile short *imagePtr) {
    int x, y;
    short tempPixel;
    // Iterate through half of the image horizontally
    for (y = 0; y < 240; y++) {
        for (x = 0; x < 160; x++) {
            // Calculate the corresponding pixel on the other half
            int mirrored_x = 319 - x;
            // Swap pixels between the two halves
            tempPixel = *(imagePtr + (y << 9) + x);
            *(imagePtr + (y << 9) + x) = *(imagePtr + (y << 9) + mirrored_x);
            *(imagePtr + (y << 9) + mirrored_x) = tempPixel;
        }
    }
}

// Black and white image function
void convertBnW(volatile short *imagePtr){
    int x, y;
    short sum = 0;
    short average;
    // Calculate the average pixel value
    average = sum / (240 * 320);
    // Convert each pixel based on the average and threshold
    for (y = 0; y < 240; y++) {
        for (x = 0; x < 320; x++) {
            short pixel = *(imagePtr + (y << 9) + x);
            // Compare pixel value with threshold and set to black or white accordingly
            if (pixel >= average) {
                *(imagePtr + (y << 9) + x) = WHITE_PIXEL;
            } else {
                *(imagePtr + (y << 9) + x) = BLACK_PIXEL;
            }
        }
    }
}

// Invert pixels function
void invertPixels(volatile short *imagePtr){
    int x, y;
    short sum = 0;
    short average;
    // Calculate the average pixel value
    average = sum / (240 * 320);
    // Convert each pixel based on the average and threshold
    for (y = 0; y < 240; y++) {
        for (x = 0; x < 320; x++) {
            short pixel = *(imagePtr + (y << 9) + x);
            // Compare pixel value with threshold and set to black or white accordingly
            if (pixel >= average) {
                *(imagePtr + (y << 9) + x) = BLACK_PIXEL;
            } else {
                *(imagePtr + (y << 9) + x) = WHITE_PIXEL;
            }
        }
    }
}


