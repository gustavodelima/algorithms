<?php
function insertionSort(array &$arr)
{
    $length = count($arr);
    for ($i = 1; $i < $length; $i++) {
        $key = $arr[$i];
        $j = $i - 1;

        // Move elements of arr[0..i-1], that are greater than key, to one position ahead of their current position
        while ($j >= 0 && $arr[$j] > $key) {
            $arr[$j + 1] = $arr[$j];
            $j = $j - 1;
        }
        $arr[$j + 1] = $key;
    }
}

// Example usage:
$sampleArray = [5, 3, 8, 4, 2];
insertionSort($sampleArray);
echo "Sorted Array:\n";
print_r($sampleArray);
?>
