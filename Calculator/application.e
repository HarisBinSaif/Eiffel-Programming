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
    
    calc: CALCULATOR
    
    make
            -- Run application.
        local
            a1, a2: integer
        do
            create calc
            io.read_integer
            a1 := io.last_integer
            io.read_integer
            a2 := io.last_integer
            print (calc.add (a1,a2).out + " " + calc.subtract (a1,a2).out + " " +
            calc.multiply (a1, a2).out + " " + 
            calc.integer_divide (a1, a2).out + " " + calc.reminder (a1, a2).out)
        end

end