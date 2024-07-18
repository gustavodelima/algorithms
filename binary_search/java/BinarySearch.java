public class BinarySearch {

    // Method to perform binary search on a sorted array
    public static int binarySearch(int[] arr, int target) {
        int left = 0; // Start index
        int right = arr.length - 1; // End index

        while (left <= right) {
            int mid = left + (right - left) / 2; // Calculate mid point

            // Check if target is present at mid
            if (arr[mid] == target) {
                return mid; // Return the index of the target
            }

            // If target greater, ignore left half
            if (arr[mid] < target) {
                left = mid + 1;
            }
            // If target is smaller, ignore right half
            else {
                right = mid - 1;
            }
        }

        // Target was not found in the array
        return -1;
    }

    public static void main(String[] args) {
        int[] data = {2, 3, 4, 10, 40}; // Example sorted array
        int target = 10; // Target value to find

        int result = binarySearch(data, target);
        if (result == -1) {
            System.out.println("Element not present");
        } else {
            System.out.println("Element found at index: " + result);
        }
    }
}
