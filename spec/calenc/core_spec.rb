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
    let(:str){ Calenc::Core.new(*params).to_s }
    let(:date){ Date.new(2018,11,29) }

    context 'パラメータを指定しない場合' do
      let(:params){ nil }

      it 'return something' do
        expect(str).not_to be_nil
      end

      it 'is a kind of String class' do
        expect(str).to be_a(String)
      end
    end

    context '日付を指定した場合' do
      let(:params){ [7, date] }

      it '指定した日付から一週間分の日付の文字列を返すこと' do
        expect(str).to eq "11/29(木)\n11/30(金)\n12/01(土)\n12/02(日)\n12/03(月)\n12/04(火)\n12/05(水)\n"
      end
    end

    context '日数を指定した場合' do
      let(:params){ [3, date] }

      it '指定した日数分の日付の文字列を返すこと' do
        expect(str).to eq "11/29(木)\n11/30(金)\n12/01(土)\n"
      end
    end
  end
end
