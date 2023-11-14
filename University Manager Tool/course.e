note
    description : "Objects of this class represent university courses."
    author      : "MP"
    revision    : "$Revision$"
    author      : "MP"

class
    COURSE
inherit 
    ANY
redefine
    out
end

create
    make

feature {NONE} -- Initialization

    make (a_code, a_description: STRING)
            -- Create with a_code and a_description.
        do
            code := a_code
            description := a_description
        end

feature -- Status
    
    code: STRING
    
    description: STRING

feature -- String representation

    out: STRING
        do
            Result := "course {" + code + ", " + description + "}"
        end
   
end