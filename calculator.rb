class RPNCalculator
  attr_reader :stack

  def initialize
    @stack = []
  end

  def operation(op)
    if @stack.length < 2
      return "Not Enough Arguments"
    elsif op == :/ and @stack.last == 0
      return "Can't Divide By 0"
    else
      second = @stack.pop
      first  = @stack.pop
      first = first.to_f if op == :/
      result = first.send(op,second)
      number(result)
    end
  end

  def number(n)
    return "Not A Number" unless n.is_a? Numeric
    @stack.push (n%1).zero? ? n.to_i : n
    @stack.last
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
        puts operation(token.to_sym)
      elsif token == "0" or token.to_f != 0
        puts number(token.to_f)
      else
        puts "Invalid Entry; only numbers and + - * / allowed"
      end
    end
  end
end

calc = RPNCalculator.new
#calc.take_input
