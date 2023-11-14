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
    
    make
            -- Run application.
        local 
            m, i1, i2: INTEGER_32
            modulo_int1, modulo_int2: MODULO_INTEGER
        do
            io.read_integer_32
            m := io.last_integer
            io.read_integer_32
            i1 := io.last_integer
            io.read_integer_32
            i2 := io.last_integer
            create modulo_int1.make (i1, m)
            create modulo_int2.make (i2, m)
            print (modulo_int1.add (modulo_int2).string_representation + " " + 
                modulo_int1.subtract (modulo_int2).string_representation + " " +
                modulo_int1.multiply (modulo_int2).string_representation + " " + 
                modulo_int1.power (modulo_int2).string_representation + " " + 
                modulo_int1.is_congruent_modulo (modulo_int2).out)        
        end
end