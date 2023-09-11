# Зчитуємо предмети з аргументів командного рядка
player1_choice = ARGV[0].downcase
player2_choice = ARGV[1].downcase

# Перевіряємо, чи обрані предмети є допустимими
valid_choices = ["stone", "paper", "scissors"]
unless valid_choices.include?(player1_choice) && valid_choices.include?(player2_choice)
  puts "Invalid choice. Please choose from: #{valid_choices.join(', ')}"
  exit
end

# Логіка гри
if player1_choice == player2_choice
  puts "It's a tie!"
elsif (player1_choice == "stone" && player2_choice == "scissors") ||
  (player1_choice == "paper" && player2_choice == "stone") ||
  (player1_choice == "scissors" && player2_choice == "paper")
  puts "You win!"
else
  puts "You lose!"
end