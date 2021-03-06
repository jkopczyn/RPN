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
        @calc.stack.push(3,4)
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

  #fake_stdin borrowed from
  #https://gist.github.com/nu7hatch/631329/d2b1c2728a24cc3cab2d6967bfef17fe89016778
  describe '#take_input' do
    before :each do
      @num = 5
      @op = :+
      allow(@calc).to receive_messages(
        number: @num,
        operation: @op)
    end

    it 'should send numbers to #number' do
      expect(@calc).to receive(:number).with(@num)
      fake_stdin(@num.to_s) do
        expect do 
          @calc.take_input
        end.to output(">#{@num}\n>\n").to_stdout
      end
    end

    it 'should send operations to #operation' do
      expect(@calc).to receive(:operation).with(@op)
      fake_stdin(@op.to_s) do
        expect do 
          @calc.take_input
        end.to output(">#{@op}\n>\n").to_stdout
      end
    end

    it 'should raise an error for anything else' do
      err = "Invalid Entry; only numbers and + - * / allowed"
      malformed = ["foo", "{1 => 'q'}", "[]"]
      malformed.each do |input|
        fake_stdin(input) do
          expect do 
            @calc.take_input
          end.to output(">#{err}\n>\n").to_stdout
        end
      end
    end
  end

  describe 'integration' do
    specify 'should be able to quit' do
      fake_stdin("q") do
        expect do 
          @calc.take_input
        end.to output('>').to_stdout
      end
    end

    specify 'should parse numbers' do
      fake_stdin("2\n3.445671\n-5\n") do
        expect do 
          @calc.take_input
        end.to output(">2\n>3.445671\n>-5\n>\n").to_stdout
        expect(@calc.stack).to eq [2,3.445671,-5]
      end
    end

    specify 'should parse operations' do 
      @calc.stack.push(7,4)
      fake_stdin("-\nq") do
        expect do 
          @calc.take_input
        end.to output(">3\n>").to_stdout
      end
      @calc.stack.push(2)
      fake_stdin("*\nq") do
        expect do 
          @calc.take_input
        end.to output(">6\n>").to_stdout
      end
      @calc.stack.push(1)
      fake_stdin("+\nq") do
        expect do 
          @calc.take_input
        end.to output(">7\n>").to_stdout
      end
      @calc.stack.push(7)
      fake_stdin("/\nq") do
        expect do 
          @calc.take_input
        end.to output(">1\n>").to_stdout
      end
    end
  end
end
