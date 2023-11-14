note
    description : "Objects of this class represent university managers."
    author      : "MP"

class
    UNIVERSITY_MANAGER

create
    make

feature {NONE} -- Initialization

    make 
            -- Initialize Current.
        do
            -- Your code here (1/2)
            -- Students Initilization
            create bill.make("00001", "Bill", "Doors")
            create linda.make("00002", "Linda", "Apples")
            create arno.make("00003", "Arno", "Zug")
            create students.make_filled(bill,1,3)
            students[1] := bill
            students[2] := linda
            students[3] := arno


            -- Initialize courses
            create calculus_1.make("calc01","calculus 1")
            create calculus_2.make("calc02","calculus 2")
            create geometry_1.make("geom01","geometry 1")
            create programming_1.make("prog01","programming 1")
            create programming_2.make("prog02","programming 2")
            create software_engineering.make("swen", "software engineering")
            
            -- Initialize degrees
            create mathematics.make("math_deg", "mathematics degree")
            create computer_science.make("cs_deg", "computer science degree")
            
        end

feature -- University handling
 
    students: ARRAY[STUDENT]

    calculus_1, geometry_1, programming_1, calculus_2, programming_2, software_engineering: COURSE
    
    mathematics, computer_science: DEGREE_PROGRAM 
    
    bill, linda, arno: STUDENT

    handle_semester
            -- Handle a semester.
        local
            calculus_1_exam_math, calculus_2_exam_math: EXAM
            calculus_1_exam_cs, programming_1_exam_cs, programming_2_exam_cs: EXAM
        do
            -- Your code here (2/2)
            mathematics.add_course(calculus_1)
            mathematics.add_course(calculus_2)
            mathematics.add_course(geometry_1)
            computer_science.add_course(calculus_1)
            computer_science.add_course(programming_1)
            computer_science.add_course(programming_2)
            computer_science.add_course(software_engineering)

            -- create exam
            create calculus_1_exam_math.make(bill,calculus_1,mathematics,6)
            create calculus_2_exam_math.make(bill,calculus_2,mathematics,5)
            create calculus_1_exam_cs.make(linda,calculus_1,computer_science,6)
            create programming_1_exam_cs.make(linda,programming_1,computer_science,6)
            create programming_2_exam_cs.make(linda,programming_2,computer_science,6)
            
            -- assign exam to bill and linda
            bill.take_exam(calculus_1_exam_math)
            bill.take_exam(calculus_2_exam_math)
            linda.take_exam(calculus_1_exam_cs)
            linda.take_exam(programming_1_exam_cs)
            linda.take_exam(programming_2_exam_cs)
            
        end
end