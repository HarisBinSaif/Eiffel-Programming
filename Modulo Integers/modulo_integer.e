class
    MODULO_INTEGER

create
    make

feature -- Access

    modulo: INTEGER
            -- Modulo for current.
    value: INTEGER
            -- Value of current.

feature {NONE} -- Initialization

    make (val, mod: INTEGER)
            -- Initialize with value val and modulo mod.
        require
            modulo_greater_than_one: mod > 1
        do
            value := val \\ mod  -- Ensure value is within the modulo range.
            modulo := mod
        end

feature  -- Operations

    create_modulo_integer (val, mod: INTEGER): MODULO_INTEGER
        -- Create a new MODULO_INTEGER with value val and modulo mod.
    local
        new_mod_int: MODULO_INTEGER
    do
        create new_mod_int.make (val, mod)
        Result := new_mod_int
    end

    add (mod_int: MODULO_INTEGER): MODULO_INTEGER
            -- Add mod_int to current modulo current and return a new modulo integer representing the sum of the two.
        do
            Result := create_modulo_integer ((value + mod_int.value) \\ modulo, modulo)
        end

   subtract (mod_int: MODULO_INTEGER): MODULO_INTEGER
    -- Subtract mod_int from current modulo current and return a new modulo integer representing the difference of the two.
do
    Result := create_modulo_integer ((value - mod_int.value + modulo * 2) \\ modulo, modulo)
end



    multiply (mod_int: MODULO_INTEGER): MODULO_INTEGER
            -- Multiply mod_int to current modulo current and return a new modulo integer representing the product of the two.
        do
            Result := create_modulo_integer ((value * mod_int.value) \\ modulo, modulo)
        end

    power (mod_int: MODULO_INTEGER): MODULO_INTEGER
            -- Return a new modulo integer representing current to the power of mod_int modulo current modulo.
            -- If both Current and mod_int are 0 then Result is assumed to be 1.
        require
            arg_power_positive: mod_int.value >= 0
        local
            i, result_value: INTEGER
        do
            if value = 0 and mod_int.value = 0 then
                Result := create_modulo_integer (1, modulo)
            else
                result_value := 1
                from i := 1 until i > mod_int.value
                loop
                    result_value := (result_value * value) \\ modulo
                    i := i + 1
                end
                Result := create_modulo_integer (result_value, modulo)
            end
        ensure
            Current.value \\ Current.modulo = 0 and
            mod_int.value \\ mod_int.modulo = 0 implies
            Result.value = 1
        end

    is_congruent_modulo (mod_int: MODULO_INTEGER): BOOLEAN
            -- Is current congruent to mod_int using the current modulo?
        do
            Result := (value \\ modulo = mod_int.value \\ modulo)
        end

    string_representation: STRING
            -- String representation of Current.
        do
            Result := value.out
        end

invariant
    modulo_greater_than_one: modulo > 1
end