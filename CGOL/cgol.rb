require 'set'

class Cell < Struct.new(:x, :y)
end

def cell_in_seed(cell, seed, x, y)
	for k in seed
		if k[:x] == cell[:x] + x && k[:y] == cell[:y] + y
			return true
		end
	end
	return false
end

def get_x(i)
	return (i-1)%3 - 1
end

def get_y(i)
	return (i-1)/3 - 1
end

def will_live(seed, cell)
	c = -1
	for i in (1..9)
		if cell_in_seed(cell, seed, get_x(i), get_y(i))
			c +=1
		end
	end
	if c == 2 || c == 3
		return true
	end
	return false
end

def come_alive ( seed )
	ret = []
	maxX = 0
	maxY = 0
	for x in seed
		if x[:x] > maxX
			maxX = x[:x]
		end
		if x[:y] > maxY
			maxY = x[:y]
		end
	end
	maxX +=1
	maxY +=1
	(0..maxX).each do |i|
		(0..maxY).each do |j|
			coco = 0
			c = Cell.new(i, j)
			for g in (1..9)
				if cell_in_seed(c, seed, get_x(g), get_y(g))
					coco +=1
				end
			end
			if coco == 3
				ret.push(c)
			end	
		end
	end
	return ret
end


def evolve_universe(seed)
	a = []
	for x in seed
		if will_live(seed, x)	
			a.push(x)
		end
	end
	a = a + come_alive(seed)
	a.to_set
end

