def factorial(number)
  if number == 0
    return 1
  else
    return number * factorial(number - 1)
  end
end

print "Введіть число: "
number = gets.to_i

if number < 0
  puts "Факторіал визначений тільки для не від'ємних чисел."
else
  result = factorial(number)
  puts "Факторіал #{number} = #{result}"
end

