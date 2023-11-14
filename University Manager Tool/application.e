note
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
			uni_manager: UNIVERSITY_MANAGER
			index: INTEGER
		do
			io.read_integer
            index := io.last_integer
	    	create uni_manager.make 
			uni_manager.handle_semester
			print(uni_manager.students[index].out)
		end
end