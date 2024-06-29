# lib/string_calculator.rb
class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter = ","
    if numbers.start_with?("//")
      parts = numbers.split("\n", 2)
      delimiter = parse_delimiters(parts[0])
      numbers = parts[1]
    end

    number_list = numbers.split(/#{delimiter}|\n/).map(&:to_i)
    negatives = number_list.select { |n| n < 0 }

    unless negatives.empty?
      raise "negatives not allowed: #{negatives.join(', ')}"
    end

    number_list.reject { |n| n > 1000 }.sum
  end

  private

  def parse_delimiters(delimiters_str)
    if delimiters_str.start_with?("//[")
      delimiters = delimiters_str.scan(/\[(.*?)\]/).flatten
      delimiters.map { |delim| Regexp.escape(delim) }.join('|')
    else
      Regexp.escape(delimiters_str[2])
    end
  end
end
