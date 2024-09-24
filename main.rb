# Ten tries
# 6 colors
# 4 slots

# Correct spot = black peg
# Wrong spot right color = white peg

COLORS = %w(
  r
  b
  y
  g
  p
  o
)

secret_code = Array.new(4) { COLORS.sample }
puts(secret_code)

puts("Make a guess, space-separated")
puts("Options: r b y g p o")
first_guess = gets.chomp.split(" ")

pegs = []
cloned_code = secret_code.clone

first_guess.each_with_index do |letter, idx|
  if cloned_code[idx] == letter
    cloned_code[idx] = "black"
  end
end

first_guess.each do |letter|
  if cloned_code.include?(letter)
    cloned_code[cloned_code.index(letter)] = "white"
  end
end

puts(cloned_code.filter { |l| ["black", "white"].include?(l) }.sort)