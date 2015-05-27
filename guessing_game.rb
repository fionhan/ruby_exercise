number = rand(10)+1

puts "Welcome to my guessing game"
puts "-" * 20
puts "Guess my number (1-10) >"
#--code 1-----------------------------
#guess=gets
#p guess => "3\n" a string contains \n
#p number => 8 a random number
#--code 1 begin-----------------------

win=false
puts "Guess my number:"
5.times do #can be replace with for i in 0..5  or (0..5).each do |i|
  guess=gets.to_i
  if guess==number
    win=true
    break
  else
    if guess>number
      puts "Your number is bigger"
    else
      if guess<number
        puts "Your number is smaller"
      end
    end
  end
end
if win
  puts "You win"
else
  puts "You lose, The number is #{number}"
end



