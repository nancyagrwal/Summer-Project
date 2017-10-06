def stock_picker(prices)
	largest_diff = 0
	final_best_days = []
	current_diff = 0
	current_best_days = []
	
	# Step through each day in the array
	prices.each_with_index do |price, i|
		# Reset today's variables
		current_diff = 0
		current_best_days = []
		# As long as the day isn't the last day
		if i != prices.length - 1
			j = i+1
			# Step through every day AFTER the current day
			until j == prices.length - 1
			
				if (prices[j] - price) > current_diff
				
					current_diff = prices[j] -  price
			
					current_best_days = [i, j]
				end
			
				j += 1
			end
		
			if current_diff > largest_diff
		
				largest_diff = current_diff

				final_best_days = current_best_days
			end
		end
		
	end
	
	print final_best_days
end

stock_picker([17,3,6,9,15,8,6,1,10]) # => [1,4]  
