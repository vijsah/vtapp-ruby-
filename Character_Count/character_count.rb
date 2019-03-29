def count_characters(text)
	frequency=Hash.new(0)
	text.each_char do |char|
		next unless char=~/[a-z]|[A-Z]/
		frequency[char]+=1
	end
	puts frequency
end
puts "Enter the text:"
text=gets.chomp
count_characters(text)

