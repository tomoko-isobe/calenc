describe ::Calenc::Command do
  context 'No command line option' do
    it 'output some string' do
      expect{ Calenc::Command.run }.to output(be_a_kind_of(String)).to_stdout
    end

    it 'output date string' do
      exp= /\d\d\/\d\d\(.\)\n/
      expect{ Calenc::Command.run }.to output(match(exp)).to_stdout
    end

    it 'output 7 days' do
      expect{ Calenc::Command.run }.to output(satisfy{|s| s.split("\n").count== 7 }).to_stdout
    end
  end

  context 'With command line option' do
    it 'days count' do
      ARGV.clear
      ARGV.concat(["--count", "3"])
      expect(Calenc::Core).to receive(:new).with(3, anything, anything).and_return(Calenc::Core.new(3,Date.today,false))
      Calenc::Command.run
    end

    it 'interactive flag' do
      ARGV.clear
      ARGV.concat(["--interactive"])
      expect(Calenc::Core).to receive(:new).with(anything, anything, true).and_return(Calenc::Core.new(3,Date.today,false))
      Calenc::Command.run
    end
  end
end
