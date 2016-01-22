require './calculator'

describe  RPNCalculator do
  before :each do
    @calc = RPNCalculator.new
  end

  it 'should create an object' do
    expect(@calc).to be_a(RPNCalculator)
    expect(@calc.stack).to be_empty
  end
end
