class StringCalculator
  
  def add(numbers)
    return 0 if numbers.empty?
    delimiter = ","
    if numbers.start_with?("//")
      parts = numbers.split("\n", 2)
      delimiter = parts[0][2..-1]
      numbers = parts[1]
    end

    number_list = numbers.split(/#{Regexp.escape(delimiter)}|\n/).map(&:to_i)
    negatives = number_list.select { |n| n < 0 }
    unless negatives.empty?
      raise "negative numbers not allowed: #{negatives.join(', ')}"
    end

    number_list.sum
  end

end