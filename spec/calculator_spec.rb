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
      expect(@calc.number("foo")).to eq "Not A Number"
      expect(@calc.number(:bar)).to eq "Not A Number"
      expect(@calc.number(:+)).to eq "Not A Number"
      expect(@calc.number({1 => 'q'})).to eq "Not A Number"
      expect(@calc.number([])).to eq "Not A Number"
      expect(@calc.number("1")).to eq "Not A Number"
      expect(@calc.number("0")).to eq "Not A Number"
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
      expect(@calc.operation("foo")).to eq "Not A Valid Operation"
      expect(@calc.operation(:bar)).to eq "Not A Valid Operation"
      expect(@calc.operation(3)).to eq "Not A Valid Operation"
      expect(@calc.operation({1 => 'q'})).to eq "Not A Valid Operation"
      expect(@calc.operation([])).to eq "Not A Valid Operation"
      expect(@calc.operation("1")).to eq "Not A Valid Operation"
      expect(@calc.operation("0")).to eq "Not A Valid Operation"
    end
    
    it 'should accept all four normal operations' do
      expect(@calc.operation(:+)).to_not eq "Not A Valid Operation"
      expect(@calc.operation(:-)).to_not eq "Not A Valid Operation"
      expect(@calc.operation(:*)).to_not eq "Not A Valid Operation"
      expect(@calc.operation(:/)).to_not eq "Not A Valid Operation"
    end
    context 'with numbers on the stack' do
      before :each do
        @calc.stack.push(3)
        @calc.stack.push(4)
      end

      it 'should add correctly' do
        expect(@calc.operation(:+)).to eq 7
      end

      it 'should subtract correctly' do
        expect(@calc.operation(:-)).to eq -1
      end

      it 'should multiply correctly' do
        expect(@calc.operation(:*)).to eq 12
      end

      it 'should divide correctly' do
        expect(@calc.operation(:/)).to eq 0.75
      end

      it 'should put the results of operations on the stack' do
        @calc.operation(:+)
        expect(@calc.stack.last).to eq 7
        @calc.stack.push(3)
        @calc.stack.push(4)
        @calc.operation(:-)
        expect(@calc.stack.last).to eq -1
        @calc.stack.push(3)
        @calc.stack.push(4)
        @calc.operation(:*)
        expect(@calc.stack.last).to eq 12
        @calc.stack.push(3)
        @calc.stack.push(4)
        @calc.operation(:/)
        expect(@calc.stack.last).to eq 0.75
      end
    end

    context 'without a suitable stack' do
      it 'should reject operations with less than two operands available' do
        expect(@calc.operation(:+)).to eq "Not Enough Arguments"
        expect(@calc.operation(:-)).to eq "Not Enough Arguments"
        expect(@calc.operation(:*)).to eq "Not Enough Arguments"
        expect(@calc.operation(:/)).to eq "Not Enough Arguments"
        @calc.stack.push(3)
        expect(@calc.operation(:+)).to eq "Not Enough Arguments"
        expect(@calc.operation(:-)).to eq "Not Enough Arguments"
        expect(@calc.operation(:*)).to eq "Not Enough Arguments"
        expect(@calc.operation(:/)).to eq "Not Enough Arguments"
      end

      it 'should reject division if it would divide by zero' do
        @calc.stack.push(3)
        @calc.stack.push(0)
        expect(@calc.operation(:/)).to eq "Can't Divide By 0"
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
