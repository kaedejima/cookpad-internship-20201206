RSpec.describe Poll do
  it 'has a title and candidates' do
    poll = Poll.new('Awesome Poll', ['Alice','Bob'])

    expect(poll.title).to eq 'Awsome Poll'
    expect(poll.candidates).to eq['Alice', 'Bob']
  end
end