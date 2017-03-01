# 랜덤한 수를 생성하고, 사용자가 추측하는 프로그램
class GuessNumber
    attr_accessor :max, :num, :line

    def initialize
        @max = 50
        @num = rand(max)+1
        @line = @num+1
    end

    def prompt
        print "Enter your number between 0 and #{max} : "
        @line = gets.to_i
        answer_check
    end

    def play
        until @num == @line do
            prompt
        end
    end

    def answer_check
        compare = "bigger than"  if @num > @line
        compare = "smaller than" if @num < @line
        compare = "correct." if @num == @line
        puts "the answer is #{compare}  your input. : #{line}"    
    end

end

GuessNumber.new.play
