describe ::Calenc::Command do
  it 'clip some string' do
    Calenc::Command.run
    str= Clipboard.paste.encode('UTF-8')
    expect(str).to be_a(String)
  end
end
