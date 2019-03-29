def replace_vowel(text)
	text.gsub(/[aeiou]|[AEIOU]/,'*')
end

puts"Please provide an input"
text=gets.chomp
puts replace_vowel(text)

