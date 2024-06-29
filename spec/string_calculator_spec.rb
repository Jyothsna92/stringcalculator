require 'string_calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    it 'returns 0 for an empty string' do
      calculator = StringCalculator.new
      expect(calculator.add("")).to eq(0)
    end

    it 'returns the number for a single number string' do
      calculator = StringCalculator.new
      expect(calculator.add("1")).to eq(1)
    end

    it 'returns the sum of two numbers' do
      calculator = StringCalculator.new
      expect(calculator.add("1,2")).to eq(3)
    end

    it 'returns the sum of multiple numbers' do
      calculator = StringCalculator.new
      expect(calculator.add("1,2,3,4,5")).to eq(15)
    end

    it 'returns the sum of numbers with new lines between them' do
      calculator = StringCalculator.new
      expect(calculator.add("1\n2,3")).to eq(6)
    end

    it 'returns the sum of numbers with a custom delimiter' do
      calculator = StringCalculator.new
      expect(calculator.add("//;\n1;2")).to eq(3)
    end

    it 'raises an exception for negative numbers' do
      calculator = StringCalculator.new
      expect { calculator.add("1,-2,3") }.to raise_error("negative numbers not allowed: -2")
    end

    it 'raises an exception for multiple negative numbers' do
      calculator = StringCalculator.new
      expect { calculator.add("1,-2,3,-4") }.to raise_error("negative numbers not allowed: -2, -4")
    end
  end
end