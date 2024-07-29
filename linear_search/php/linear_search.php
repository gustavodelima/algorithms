<?php
// Function to perform linear search
function linearSearch($array, $target) {
    // Loop through each element in the array
    for ($i = 0; $i < count($array); $i++) {
        // Check if the current element is equal to the target
        if ($array[$i] == $target) {
            return $i; // Return the index if the target is found
        }
    }
    return -1; // Return -1 if the target is not found
}

// Example usage
$array = array(10, 20, 30, 40, 50);
$target = 30;
$result = linearSearch($array, $target);

if ($result != -1) {
    echo "Element found at index: " . $result;
} else {
    echo "Element not found in the array";
}
?>
