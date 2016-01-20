class RPNCalculator
  def initialize
    @stack = []
  end

  def operation(op)
    if @stack.length < 2
      puts "Not Enough Arguments"
      return
    elsif op == :/ and @stack.last == 0
      puts "Can't Divide By 0"
      return
    else
      second = @stack.pop
      first  = @stack.pop
      first = first.to_f if op == :/
      result = first.send(op,second)
      @stack.push (result%1).zero? ? result.to_i : result
      puts @stack.last
    end
  end

  def number(n)
    @stack.push (n%1).zero? ? n.to_i : n
    puts @stack.last
  end

  def take_input
    while true
      print ">"
      token = gets
      if token.nil?
        print "\n"
        return
      elsif token.strip! == "q"
        return
      elsif %w[+ - * /].include?(token)
        operation(token.to_sym)
      elsif token == "0" or token.to_f != 0
        number(token.to_f)
      else
        puts "Invalid Entry; only numbers and + - * / allowed"
      end
    end
  end
end

calc = RPNCalculator.new
calc.take_input
