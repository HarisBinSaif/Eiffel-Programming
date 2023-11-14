note
    description : "this class implements a simple calculator."
    date        : "$Date$"
    revision    : "$Revision$"

class
    CALCULATOR

feature -- Initialization

    add (a1, a2: INTEGER): INTEGER
        do
            Result := a1 + a2
        end

    subtract (a1, a2: INTEGER): INTEGER
        do
            Result := a1 - a2
        end

    multiply (a1, a2: INTEGER): INTEGER
        do
            Result := a1 * a2
        end

    integer_divide (a1, a2: INTEGER): INTEGER
        require
            divisor_not_zero: a2 /= 0
        do
            Result := a1 // a2
        end

    reminder (a1, a2: INTEGER): INTEGER
        require
            divisor_not_zero: a2 /= 0
        do
            Result := a1 \\ a2
        end

end