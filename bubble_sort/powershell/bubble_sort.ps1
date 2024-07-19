function Bubble-Sort {
    param([int[]]$arr)

    $n = $arr.Length
    for ($i = 0; $i -lt $n; $i++) {
        for ($j = 0; $j -lt $n - $i - 1; $j++) {
            if ($arr[$j] -gt $arr[$j + 1]) {
                # Swapping the elements
                $temp = $arr[$j]
                $arr[$j] = $arr[$j + 1]
                $arr[$j + 1] = $temp
            }
        }
    }

    return $arr
}

# Example array
$array = 64, 34, 25, 12, 22, 11, 90

# Sorting the array
$sortedArray = Bubble-Sort -arr $array

# Output the sorted array
$sortedArray

