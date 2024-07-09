#include <stdio.h>

void bubbleSort(int array[], int size) {
    for (int step = 0; step < size - 1; ++step) {
        // Declare a variable to check if any swapping happened
        int swapped = 0;
        
        // Perform the steps needed for each pass through the array
        for (int i = 0; i < size - step - 1; ++i) {
            // Compare adjacent elements and swap them if they are in the wrong order
            if (array[i] > array[i + 1]) {
                int temp = array[i];
                array[i] = array[i + 1];
                array[i + 1] = temp;
                swapped = 1;
            }
        }
        
        // If no two elements were swapped by inner loop, then break
        if (swapped == 0) {
            break;
        }
    }
}

// Function to print the array
void printArray(int array[], int size) {
    for (int i = 0; i < size; ++i) {
        printf("%d ", array[i]);
    }
    printf("\n");
}

int main() {
    int data[] = {64, 34, 25, 12, 22, 11, 90};
    int size = sizeof(data) / sizeof(data[0]);
    bubbleSort(data, size);
    printf("Sorted Array in Ascending Order:\n");
    printArray(data, size);
    return 0;
}
