class RPNCalculator
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
    elsif token in %w[+ - * /]
      calc.operation(token.to_sym)
    elsif token == "0" or token.to_i != 0
      calc.number(token.to_i)
    end
end
