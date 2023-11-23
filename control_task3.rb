def word_count(str)
  word_count_hash = Hash.new(0)
  words = str.split(/\s+/)
  words.each { |word| word_count_hash[word.downcase] += 1 }
  return word_count_hash
end

# Приклад використання
text = gets
result = word_count(text)
puts result