require './calculator'

describe  RPNCalculator do
  before :each do
    @calc = RPNCalculator.new
  end

  it 'should create an empty calculator' do
    expect(@calc).to be_a(RPNCalculator)
    expect(@calc.stack).to be_empty
  end

  describe '#number' do
    it 'should accept numbers' do
      expect(@calc.number(5)).to eq 5
      expect(@calc.stack).to eq 5
    end

    it 'should accept negative numbers' do
    end

    it 'should accept decimals' do
    end

    it 'should reject non-numbers unless they are operations' do
    end
  end

  describe '#operation' do
    it 'should reject non-operations' do
    end
    
    it 'should accept all four normal operations' do
    end
    context 'with numbers on the stack' do
      before :each do
        @calc.stack.push(3)
        @calc.stack.push(4)
      end

      it 'should add correctly' do
      end

      it 'should subtract correctly' do
      end

      it 'should multiply correctly' do
      end

      it 'should divide correctly' do
      end

      it 'should put the results of operations on the stack' do
      end
    end

    context 'without a suitable stack' do
      it 'should reject operations with less than two operands available' do
      end

      it 'should reject division if it would divide by zero' do
      end
    end


  end

  describe '#take_input' do
    it 'should be able to quit' do
    end

    it 'should parse numbers' do
    end

    it 'should parse operations' do
    end
  end
end
