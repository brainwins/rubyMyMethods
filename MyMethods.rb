random_array = [2, 4, 6, 10, 2, 5, 3]
myHash = {"cats" => 3, "dogs" =>2}

module Enumerable
	def myEach
		for i in 0...self.length do
			yield (self[i])
		end
	end
	
	def myEach_with_index
		for i in 0...self.length do
			yield self.keys[i], self.values[i]
		end
	end
	
	def mySelect
		for i in 0...self.length do
			yield self[i]
		end
	end
	
	def myAll?
		result = false
		 self.myEach {|x| result=true ? yield(x) : result=false}
		result
	end
	
	def myAny?
		result = false
		self.myEach {|x| result=true ? yield(x) : result=false}
		result
	end
	
	def myMap
	end
	
	def myCount(*x)
		count = 0
		
		if block_given?
			truthCount = 0
			self.myEach {|i| if yield(i) == true
							truthCount += 1
						end
			}

		return truthCount

		elsif x.length > 0

			self.myEach {|i| count += 1 if i == x[0]}

		return count
		

		else
			for i in 0...self.length
				count += 1
			end
		return count 	
		
		end
	end
	
	def myInject(i=0)
			self.myEach{ |input| i = yield(i, input)}
			return i
	end
	
	
end




#random_array.myEach {|arry| puts "my each does: #{arry*2}"}
#random_array.each {|num| puts "each does: #{num*2}"}
#myHash.myEach_with_index {|key, value| puts "Key is #{key}, and #{value}"}
#random_array.myAll? {|num| num < 3}
#random_array.myInject{|x| x + 2}
random_array.myCount



