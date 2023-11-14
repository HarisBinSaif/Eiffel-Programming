class
    ARRAY_SORTER

feature  -- Sorters 

  sort (array_to_sort: ARRAY[INTEGER]): ARRAY[INTEGER]
    -- Sort array_to_sort into result without side effect using quicksort.
    local
        sorted_array: ARRAY[INTEGER]
    do
        -- Make a copy of the input array
        create sorted_array.make_from_array(array_to_sort)

        -- Call the quicksort algorithm on the copied array
        quick_sort(sorted_array, 1, sorted_array.count)

        -- Return the sorted array
        Result := sorted_array
    end

  quick_sort(arr: ARRAY[INTEGER]; low, high: INTEGER)
    -- QuickSort algorithm to sort the array
    local
        pivot: INTEGER
    do
        if low < high then
            -- Partition the array and get the pivot index
            pivot := partition(arr, low, high)

            -- Recursively sort the subarrays
            quick_sort(arr, low, pivot - 1)
            quick_sort(arr, pivot + 1, high)
        end
    end

  partition(arr: ARRAY[INTEGER]; low, high: INTEGER): INTEGER
    -- Helper function to partition the array
    local
        pivot_value, temp: INTEGER
        i, j: INTEGER
    do
        pivot_value := arr[high]
        i := low - 1

        from
            j := low
        until
            j >= high
        loop
            if arr[j] <= pivot_value then
                i := i + 1
                -- Swap arr[i] and arr[j]
                temp := arr[i]
                arr[i] := arr[j]
                arr[j] := temp
            end
            j := j + 1
        end

        -- Swap arr[i + 1] and arr[high]
        temp := arr[i + 1]
        arr[i + 1] := arr[high]
        arr[high] := temp

        -- Return the pivot index
        Result := i + 1
    end

feature		--Output

   print_array (arr: ARRAY[INTEGER])
    -- Pretty print string array
    local
        i: INTEGER
    do
        from
            i := 1
            print("[")
        until
            i > arr.count
        loop
            print (arr[i].out)
            if (i < arr.count) then
                print(" ")
            end
            i := i + 1
        end
        print ("]")
    end
end