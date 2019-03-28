def series &block
	yield 
end

def calculation number
	a=0
	b=1
	c=0
	print "#{b} "
	while c<=number 
		c=a+b 
		break if c>number
		print " #{c} "
		a=b
		b=c
	end
end
series do 
	puts "Enter the Fibonacci value"
	number=gets.to_i
	puts "Fibonnaci Series is"
	calculation number

end
