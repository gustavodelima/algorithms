public class InsertionSort {
    // Function to perform insertion sort on an array
    public static void insertionSort(int[] array) {
        for (int i = 1; i < array.length; i++) {
            int key = array[i]; // Take the current element
            int j = i - 1;

            // Compare the key with the elements on its left until an element smaller than it is found
            while (j >= 0 && array[j] > key) {
                array[j + 1] = array[j]; // Shift elements to the right to make room for the key
                j = j - 1;
            }
            array[j + 1] = key; // Place the key at its correct position
        }
    }

    // Main method to test the insertion sort
    public static void main(String[] args) {
        int[] array = {9, 7, 5, 11, 12, 2, 14, 3, 10, 6};

        System.out.println("Original Array:");
        for (int num : array) {
            System.out.print(num + " ");
        }

        insertionSort(array); // Sorting the array using insertion sort

        System.out.println("\nSorted Array:");
        for (int num : array) {
            System.out.print(num + " ");
        }
    }
}
