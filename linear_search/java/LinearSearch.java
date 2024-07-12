public class LinearSearch {

    /**
     * This method performs a linear search in an array to find a specific element.
     * 
     * @param array The array to search through.
     * @param key The element to find in the array.
     * @return The index of the element if found, otherwise -1.
     */
    public static int linearSearch(int[] array, int key) {
        for (int index = 0; index < array.length; index++) {
            if (array[index] == key) {
                return index;
            }
        }
        return -1; // key not found in the array
    }

    public static void main(String[] args) {
        int[] data = {10, 20, 80, 30, 60, 50, 110, 100, 130, 170};

        int key = 110;
        int result = linearSearch(data, key);

        if (result == -1) {
            System.out.println("Element not found in the array.");
        } else {
            System.out.println("Element found at index: " + result);
        }
    }
}
