class RPNCalculator
end

calc = RPNCalculator.new
while true
    print ">"
    token = gets
    if token.nil?
      print "\n"
      break
    elsif token.strip == "q"
      break
    end
end
