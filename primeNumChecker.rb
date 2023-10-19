def is_prime?(number)
  return false if number <= 1

  (2..number - 1).each do |i|
    if (number % i) == 0
      return false
    end
  end

  return true
end

print "Введіть число для перевірки на простоту: "
number = gets.to_i

if is_prime?(number)
  puts "#{number} є простим числом."
else
  puts "#{number} не є простим числом."
end


