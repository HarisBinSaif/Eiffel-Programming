note
    description : "Objects of this class represent university students."
    date        : "$Date$"
    revision    : "$Revision$"
    author      : "MP"

class
    STUDENT

inherit 
    ANY
redefine
    is_equal,
    out
end

create
    make
    
feature {NONE} -- Initialization

    make (a_code, a_first_name, a_last_name: STRING)
            -- Create with a_first_name and a_last_name.
        do
            code := a_code
            first_name := a_first_name
            last_name := a_last_name
            create exams_taken.make_empty
            exams_taken.compare_objects
        end

feature -- Status
    
    code: STRING
    
    first_name: STRING
    
    last_name: STRING
    
    exams_taken: ARRAY[EXAM]
    
feature  -- Basic operations

    take_exam (an_exam: EXAM)
                -- Add an_exam to exams_taken 
        do
            exams_taken.force (an_exam, (exams_taken.count + 1))
        end

feature  -- object comparison
    
    is_equal (other: like Current): BOOLEAN
			-- Is `other' attached to an object considered
			-- equal to current object?
		do
		    Result :=   code ~ other.code and
		                first_name ~ other.first_name and
		                last_name ~ other.last_name and
		                exams_taken ~ other.exams_taken
        end

feature  -- string representation
    
    out: STRING
        local
            exams_taken_string_representation: STRING
            i: INTEGER
        do
            from
                i := 1
                create exams_taken_string_representation.make_empty
            until
                i > exams_taken.count
            loop
                exams_taken_string_representation.append (exams_taken[i].out)
                exams_taken_string_representation.append (" ")
                i := i + 1
            end         
            Result := "[" + code + ", " + first_name + ", "+ last_name + "; exams: " + exams_taken_string_representation +"]"
        end
end