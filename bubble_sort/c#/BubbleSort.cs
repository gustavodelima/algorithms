using System;

class BubbleSortExample
{
    static void Main(string[] args)
    {
        int[] array = { 64, 34, 25, 12, 22, 11, 90 };
        BubbleSort(array);
        Console.WriteLine("Sorted array:");
        foreach (int value in array)
        {
            Console.Write(value + " ");
        }
    }

    static void BubbleSort(int[] arr)
    {
        int n = arr.Length;
        bool swapped;
        for (int i = 0; i < n - 1; i++)
        {
            swapped = false;
            for (int j = 0; j < n - i - 1; j++)
            {
                if (arr[j] > arr[j + 1])
                {
                    // Swap temp and arr[j]
                    int temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                    swapped = true;
                }
            }

            // IF no two elements were swapped by inner loop, then break
            if (!swapped)
                break;
        }
    }
}

