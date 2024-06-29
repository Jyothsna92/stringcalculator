require 'string_calculator'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  describe '#add' do
    context 'with basic functionality' do
      it 'returns 0 for an empty string' do
        expect(calculator.add("")).to eq(0)
      end

      it 'returns the number for a single number string' do
        expect(calculator.add("1")).to eq(1)
      end

      it 'returns the sum of two numbers' do
        expect(calculator.add("1,2")).to eq(3)
      end
    end

    context 'with an unknown amount of numbers' do
      it 'returns the sum of multiple numbers' do
        expect(calculator.add("1,2,3,4,5")).to eq(15)
      end
    end

    context 'with new lines as delimiters' do
      it 'returns the sum of numbers with new lines between them' do
        expect(calculator.add("1\n2,3")).to eq(6)
      end
    end

    context 'with custom delimiters' do
      it 'returns the sum of numbers with a custom single-character delimiter' do
        expect(calculator.add("//;\n1;2")).to eq(3)
      end

      it 'returns the sum of numbers with a custom multi-character delimiter' do
        expect(calculator.add("//[***]\n1***2***3")).to eq(6)
      end

      it 'returns the sum of numbers with multiple delimiters' do
        expect(calculator.add("//[*][%]\n1*2%3")).to eq(6)
      end

      it 'returns the sum of numbers with multiple multi-character delimiters' do
        expect(calculator.add("//[***][%%]\n1***2%%3")).to eq(6)
      end
    end

    context 'with negative numbers' do
      it 'raises an exception for a single negative number' do
        expect { calculator.add("1,-2,3") }.to raise_error("negatives not allowed: -2")
      end

      it 'raises an exception for multiple negative numbers' do
        expect { calculator.add("1,-2,3,-4") }.to raise_error("negatives not allowed: -2, -4")
      end
    end

    context 'with numbers bigger than 1000' do
      it 'ignores numbers bigger than 1000' do
        expect(calculator.add("2,1001")).to eq(2)
      end
    end
  end
end
