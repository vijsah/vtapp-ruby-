def series &block
	yield 
end

def calculation number
	a=0
	b=1
	c=0
	print " #{b} "
	c=a+b
	while c<=number 
		print " #{c} "
		a=b
		b=c
		c=a+b
	end
end
series do 
	puts "Enter the Fibonacci value"
	number=gets.to_i
	puts "Fibonnaci Series is"
	calculation number

end
