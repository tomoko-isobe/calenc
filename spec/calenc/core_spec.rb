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
end
