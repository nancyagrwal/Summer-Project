def ceaser_cipher(str, num)
	# Split string into an array of letters
	letters = str.split("")
	cipher = []
	# Step through each letter in the string
	letters.each do |l|
		# check for capital Letters
		if l.ord.between?(65,90) 
			if l.ord >= (90 - num + 1)
				# Let cipher move to beginning of alphabet
				cipher << (l.ord - 26 + num).chr
			# move forward in alphabet
			else
				cipher << (l.ord + num).chr
			end
		# check for lowercase letter
		elsif l.ord.between?(97,122)
			if l.ord >= (122 - num + 1)
				cipher << (l.ord - 26 + num).chr
			else
				cipher << (l.ord + num).chr
			end
		# spcl characters, do nothing
		else
			cipher << l
		end
	end
	print cipher.join("")
end

ceaser_cipher("Thats a Ceasar Cipher in Ruby!" , 5)
