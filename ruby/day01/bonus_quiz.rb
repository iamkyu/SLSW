#!/usr/bin/env ruby

max = 50
num = rand(max)+1
line = num+1

until num == line do
    puts "enter your number between 0 and #{max} : "
    line = gets.to_i

    if num > line
        compare = "bigger"
    
    elsif num < line
        compare = "smaller"

    else
        puts "That's correct!"
        break
    end

    puts "the answer is #{compare} than your input. you: #{line}"    
end
