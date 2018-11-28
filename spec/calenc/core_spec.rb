describe ::Calenc::Core do
  describe '#initialize' do
    it 'return something' do
      core= Calenc::Core.new
      expect(core).not_to be_nil
    end

    it 'is a kind of Core class' do
      core= Calenc::Core.new
      expect(core).to be_a(::Calenc::Core)
    end
  end

  describe '#to_s' do
    it 'return something' do
      str= Calenc::Core.new.to_s
      expect(str).not_to be_nil
    end

    it 'is a kind of String class' do
      str= Calenc::Core.new.to_s
      expect(str).to be_a(String)
    end

    it '一週間分の日付の文字列を返すこと' do
      str= Calenc::Core.new.to_s
      expect(str).to eq "11/29(木)\n11/30(金)\n12/01(土)\n12/02(日)\n12/03(月)\n12/04(火)\n12/05(水)\n"
    end
  end
end
