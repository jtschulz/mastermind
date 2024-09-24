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

def check(secret_code, guess)
  cloned_code = secret_code.clone

  guess.each_with_index do |letter, idx|
    if cloned_code[idx] == letter
      cloned_code[idx] = "black"
    end
  end

  guess.each do |letter|
    if cloned_code.include?(letter)
      cloned_code[cloned_code.index(letter)] = "white"
    end
  end

  cloned_code.filter { |l| ["black", "white"].include?(l) }.sort
end

attempt = 0
while attempt < 10
  puts("Make a guess, space-separated")
  puts("Options: r b y g p o")
  guess = gets.chomp.split(" ")
  res = check(secret_code, guess)
  if res == ["black"] * 4
    puts "you win! 🤘"
    exit
  end
  puts res
  attempt += 1
  puts "#{10 - attempt} tries left"
end

puts "you lose 💀"
