note
    description : "Objects of this class represent university exams taken by students."
    author      : "MP"

class
    EXAM
    
inherit ANY
    redefine 
        is_equal,
        out
    end

create
    make

feature {NONE} -- Initialization

    make (a_student: STUDENT; a_course: COURSE; a_degree_program: DEGREE_PROGRAM; a_grade: REAL)
            -- Create with student_code and grade.
        require
            grade_within_range: a_grade >= 0 and a_grade <= 6
        do
            student := a_student
            course := a_course
            degree_program := a_degree_program
            grade := a_grade
        end

feature -- Status
    
    student: STUDENT
    
    course: COURSE
    
    degree_program: DEGREE_PROGRAM
    
    grade: REAL

feature -- Comparison

    is_equal (other: like Current): BOOLEAN
			-- Is `other' attached to an object considered
			-- equal to current object?
		do
		    Result :=  student.code ~ other.student.code and
		               course.code ~ other.course.code and
		               degree_program.code ~ other.degree_program.code and
		               grade ~ other.grade
		end

feature -- String representation

    out: STRING
        do
            Result := "Exam: " + course.out + ", " + degree_program.out + ", " + student.code + ", " + grade.out
        end

invariant
    grade_within_range: grade >= 0.0 and grade <= 6.0

end