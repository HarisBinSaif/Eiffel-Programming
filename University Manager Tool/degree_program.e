note
    description : "Objects of this class represent university degree programs."
    author      : "MP"

class
    DEGREE_PROGRAM
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
            create courses.make_empty
        end

feature  -- Status
    
    code: STRING
    
    description: STRING
    
    courses: ARRAY[COURSE]
  
feature  -- Basic operations

    add_course (a_course: COURSE)
                -- Add a_course to courses 
        do
            courses.force (a_course, courses.count + 1)
        end
  
feature -- String representation

    out: STRING
        local
            courses_string_representation: STRING
            i: INTEGER
        do
            from
                i := 1
                create courses_string_representation.make_empty
            until
                i > courses.count
            loop
                courses_string_representation.append (courses[i].out)
                courses_string_representation.append (" ")
                i := i + 1
            end
            Result := "Degree program: {" + code + ", " + description + ", " +  "courses: [" + courses_string_representation + "]}"
        end
    
end