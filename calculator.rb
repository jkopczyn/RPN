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
end

calc = RPNCalculator.new
while true
  print ">"
  token = gets
  if token.nil?
    print "\n"
    break
  elsif token.strip! == "q"
    break
  elsif %w[+ - * /].include?(token)
    calc.operation(token.to_sym)
  elsif token == "0" or token.to_f != 0
    calc.number(token.to_f)
  else
    puts "Invalid Entry; only numbers and + - * / allowed"
  end
end
