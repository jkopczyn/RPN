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
      num = 5
      expect(@calc.number(num)).to eq num
      expect(@calc.stack.last).to eq num
    end

    it 'should reject non-numbers' do
      expect(@calc.stack).to be_empty
      @calc.number("foo")
      @calc.number(:bar)
      @calc.number({1 => 'q'})
      @calc.number([])
      @calc.number("1")
      @calc.number("0")
      expect(@calc.stack).to be_empty
    end

    it 'should accept negative numbers' do
      num = -3
      expect(@calc.number(num)).to eq num
      expect(@calc.stack.last).to eq num
    end

    it 'should accept decimals' do
      num = 2.34688334
      expect(@calc.number(num)).to eq num
      expect(@calc.stack.last).to eq num
    end
  end

  describe '#operation' do
    it 'should reject non-operations' do
      fail
    end
    
    it 'should accept all four normal operations' do
      fail
    end
    context 'with numbers on the stack' do
      before :each do
        @calc.stack.push(3)
        @calc.stack.push(4)
      end

      it 'should add correctly' do
        fail
      end

      it 'should subtract correctly' do
        fail
      end

      it 'should multiply correctly' do
        fail
      end

      it 'should divide correctly' do
        fail
      end

      it 'should put the results of operations on the stack' do
        fail
      end
    end

    context 'without a suitable stack' do
      it 'should reject operations with less than two operands available' do
        fail
      end

      it 'should reject division if it would divide by zero' do
        fail
      end
    end


  end

  describe '#take_input' do
    it 'should be able to quit' do
      fail
    end

    it 'should parse numbers' do
      fail
    end

    it 'should parse operations' do
      fail
    end
  end
end
