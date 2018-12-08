describe ::Calenc::Core do
  let(:date){ Date.new(2018,11,29) }
  let(:calenc){ Calenc::Core.new(*params) }

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
    let(:str){ calenc.to_s }

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
      context 'Date形式' do
        let(:params){ [7, date] }
        it { expect(str).to eq "11/29(木)\n11/30(金)\n12/01(土)\n12/02(日)\n12/03(月)\n12/04(火)\n12/05(水)\n" }
      end

      context '文字列形式' do
        let(:params){ [7, '2018-11-29'] }
        it { expect(str).to eq "11/29(木)\n11/30(金)\n12/01(土)\n12/02(日)\n12/03(月)\n12/04(火)\n12/05(水)\n" }
      end
    end

    context '日数を指定した場合' do
      context 'count: 3' do
        let(:params){ [3, date] }
        it { expect(str).to eq "11/29(木)\n11/30(金)\n12/01(土)\n" }
      end

      context 'count: 0' do
        let(:params){ [0, date] }
        it { expect(str).to eq "" }
      end
    end
  end

  describe '#complete?' do
    context 'interactive を false にしたとき' do
      let(:params){ [3, date, false] }
      it 'デフォルトは true' do
        expect(calenc.complete?).to be_truthy
      end
    end

    context 'interactive を true にしたとき' do
      let(:params){ [3, date, true] }
      it 'デフォルトが false' do
        expect(calenc.complete?).to be_falsey
      end
    end
  end

  describe '#output' do
    let(:params){ [3, date, true] }
    it '出力するメッセージを返す' do
      expect(calenc.output).to be_a(String)
    end
  end

  describe '#input' do
    let(:params){ [3, date, true] }
    it '値を受け取って、complete? を trueにする' do
      calenc.input 'something'
      expect(calenc.complete?).to be_truthy
    end

    it '日数を入力すると値がセットされる' do
      calenc.input '7'
      expect(calenc.count).to be 7
    end
  end

  describe '#set_days_count' do
    let(:params){ [7, date, true] }
    it '日数をセットする' do
      calenc.set_days_count('3')
      expect(calenc.count).to be 3
    end
  end
end
