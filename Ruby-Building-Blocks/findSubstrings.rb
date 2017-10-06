def find_substrings(word, dictionary)
	words = word.split(" ")
	count = Hash.new(0)
	words.each do |word|
		dictionary.each do |dword|
			# add 1 to the word cout in the count hash
			if word.downcase.include?(dword)
				count[dword] += 1
			end
		end
	end
	print count
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
find_substrings("below", dictionary) # => {"below"=>1, "low"=>1}
find_substrings("Howdy partner, sit down! How's it going?", dictionary)
	# => {"down"=>1, "how"=>2, "howdy"=>1,"go"=>1, "going"=>1, "it"=>2, "i"=> 3, "own"=>1,"part"=>1,"partner"=>1,"sit"=>1}

