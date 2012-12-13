def grep(file_name, pattern)
	i = 0
	File.open(file_name,'r').each_line{|line|
		i=i.next
		if /#{pattern}/.match(line) != nil
			puts "line #{i}: #{line}"
		end
	}
end

		
