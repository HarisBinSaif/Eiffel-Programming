note
    description : "root class of the application"
    date        : "$Date$"
    revision    : "$Revision$"

class
    APPLICATION

inherit
    ARGUMENTS

create
    make

feature {NONE} -- Initialization
    
    sorter: ARRAY_SORTER
    a1, a2, a3, a4: INTEGER 
    array_to_sort: ARRAY[INTEGER]

    make
            -- Run application.
        do
            create sorter
            io.read_integer
            a1 := io.last_integer
            io.read_integer
            a2 := io.last_integer
            io.read_integer
            a3 := io.last_integer
            io.read_integer
            a4 := io.last_integer
            create array_to_sort.make_empty
            array_to_sort.force (a1,1)
            array_to_sort.force (a2,2)
            array_to_sort.force (a3,3)
            array_to_sort.force (a4,4)
            sorter.print_array (sorter.sort (array_to_sort))
        end
end