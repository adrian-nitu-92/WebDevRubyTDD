def classify_poker_hand(poker_hand)
	counter = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
	tris = 0
	pairs = 0
	high = false
	return :not_a_ruby_array unless poker_hand.is_a? Array
	if poker_hand.size != 5
		return :too_many_or_too_few_cards
	end

	for x in poker_hand
		if x.class != Fixnum
			return :at_least_one_card_is_not_an_integer
		elsif x > 20 
			return :at_least_one_card_is_out_of_bounds
		else
			counter[x] = counter[x] + 1
		end
	end

	for x in (0..9)
		if counter[x] >= 1 && counter[x+1] >= 1 && counter[x+2] >= 1 && counter[x+3] >= 1 && counter[x+4] >= 1
			return :straight
		end
		if counter[x] >= 1 && counter[x+1] >= 1 && counter[x+2] >= 1 
			high = true
		end
	end
	for x in counter
		if x == 2
			pairs = pairs + 1
		end
		if x == 3
			tris = tris + 1
		end
		if x == 4
			return :four_of_a_kind
		end 
		if x > 4
			return :impossible_hand
		end
	end

	if tris == 1 && pairs == 1
		return :full_house
	elsif tris == 1
		return :three_of_a_kind
	elsif pairs == 2
		return :two_pairs
	elsif pairs == 1
		return :one_pair
	elsif high == true
		return :high_card
	end
	return :valid_but_nothing_special
end
