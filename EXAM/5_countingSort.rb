def counting_sort(array)
  max_value = array.max
  min_value = array.min
  range = max_value - min_value + 1

  # Ініціалізація змінних для збереження кількості входжень кожного елемента
  count = Array.new(range, 0)

  # Підрахунок кількості входжень кожного елемента
  array.each { |num| count[num - min_value] += 1 }

  # Перезапис елементів вхідного масиву в відсортованому порядку
  sorted_array = []
  count.each_with_index do |count, index|
    count.times { sorted_array << index + min_value }
  end

  sorted_array
end

# Введення несортованого масиву з клавіатури
print "Введіть несортований масив через пробіли: "
unsorted_array = gets.chomp.split.map(&:to_i)

# Виклик функції сортування
sorted_array = counting_sort(unsorted_array)

# Вивід результатів
puts "Не відсортований масив: #{unsorted_array}"
puts "Відсортований масив: #{sorted_array}"
