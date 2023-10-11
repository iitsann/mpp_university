def roman_to_int(roman)
  roman_to_int_map = {
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'L' => 50,
    'C' => 100,
    'D' => 500,
    'M' => 1000
  }

  result = 0
  prev_value = 0

  roman.reverse.each_char do |char|
    value = roman_to_int_map[char]
    if value < prev_value
      result -= value
    else
      result += value
    end
    prev_value = value
  end

  result
end

def int_to_roman(n)
  int_to_roman_map = {
    1000 => 'M',
    900 => 'CM',
    500 => 'D',
    400 => 'CD',
    100 => 'C',
    90 => 'XC',
    50 => 'L',
    40 => 'XL',
    10 => 'X',
    9 => 'IX',
    5 => 'V',
    4 => 'IV',
    1 => 'I'
  }

  result = ''

  int_to_roman_map.keys.sort { |a, b| b <=> a }.each do |value|
    while n >= value
      result += int_to_roman_map[value]
      n -= value
    end
  end

  result
end

# Введення римського числа
print 'Введіть римське число: '
roman_input = gets.chomp.upcase

# Перевірка на коректність введення
if roman_input =~ /^[IVXLCDM]+$/
  # Переводимо римське число в ціле
  integer_value = roman_to_int(roman_input)
  puts "Відповідне ціле число: #{integer_value}"

  # Введення цілого числа
  print 'Введіть ціле число (1 <= n < 4000): '
  integer_input = gets.chomp.to_i

  # Перевірка на допустимий діапазон
  if integer_input >= 1 && integer_input < 4000
    # Переводимо ціле число в римське
    roman_value = int_to_roman(integer_input)
    puts "Відповідне римське число: #{roman_value}"
  else
    puts 'Ціле число не в допустимому діапазоні'
  end
else
  puts 'Некоректне римське число'
end
