def infix_to_rpn(expression)
  precedence = { '+' => 1, '-' => 1, '*' => 2, '/' => 2 }
  output = []
  operator_stack = []

  tokens = expression.scan(/\d+|\+|\-|\*|\//)

  tokens.each do |token|
    if token.match?(/\d+/)
      output.push(token)
    elsif token.match?(/[\+\-\*\/]/)
      while !operator_stack.empty? && operator_stack.last.match?(/[\+\-\*\/]/) && precedence[operator_stack.last] >= precedence[token]
        output.push(operator_stack.pop)
      end
      operator_stack.push(token)
    end
  end

  while !operator_stack.empty?
    output.push(operator_stack.pop)
  end

  return output.join(' ')
end

input_expression = "33+2543-213*21"
rpn_expression = infix_to_rpn(input_expression)
puts rpn_expression
