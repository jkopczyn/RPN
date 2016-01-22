require './calculator'

describe  RPNCalculator do
  before :each do
    @calc = RPNCalculator.new
  end

  it 'should create an empty calculator' do
    expect(@calc).to be_a(RPNCalculator)
    expect(@calc.stack).to be_empty
  end

  it 'should be able to quit' do
  end

  it 'should accept numbers' do
  end

  it 'should accept decimals' do
  end

  it 'should accept negative numbers' do
  end

  it 'should reject non-numbers unless they are operations' do
  end

  context 'with numbers on the stack' do
    it 'should accept operations' do
    end

    it 'should add correctly' do
    end

    it 'should subtract correctly' do
    end

    it 'should multiply correctly' do
    end

    it 'should divide correctly' do
    end
  end

  context 'without a suitable stack' do
    it 'should reject operations with less than two operands available' do
    end

    it 'should reject division if it would divide by zero' do
    end
  end
end
