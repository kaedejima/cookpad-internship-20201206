require_relative '../lib/poll'

RSpec.describe Poll do
  it 'has a title and candidates' do
    poll = Poll.new('Awesome Poll', ['Alice', 'Bob'])

    expect(poll.title).to eq 'Awesome Poll'
    expect(poll.candidates).to eq ['Alice', 'Bob']
  end

  describe '#add_vote' do
    it 'saves the given vote' do
      poll = Poll.new('Awesome Poll', ['Alice', 'Bob'])
      vote = Vote.new('Miyoshi', 'Alice')

      poll.add_vote(vote)
      expect(poll.votes).to eq [vote]
    end

    context 'with a vote that has as invalid candidate' do
      it 'raises InvalidCandidateError'do
        poll = Poll.new('Awesome Poll', ['Alice', 'Bob'])
        vote = Vote.new('Miyoshi','Kaede')

        expect { poll.add_vote(vote) }.to raise_error Poll::InvalidCandidateError
      end
    end
  end

  describe '#count_votes' do
    it 'counts the votes and sort the candidates by the number of votes' do
      poll = Poll.new('Awesome Poll', ['Alice', 'Bob'])
      poll.add_vote(Vote.new('Carol', 'Alice'))
      poll.add_vote(Vote.new('Dave', 'Alice'))
      poll.add_vote(Vote.new('Ellen', 'Bob'))

      result = poll.count_votes

      expect(result['Alice']).to eq 2
      expect(result['Bob']).to eq 1
      expect(result.keys).to eq ['Alice', 'Bob']

      poll2 = Poll.new('Great Poll', ['Alice', 'Bob'])
      poll2.add_vote(Vote.new('Carol', 'Bob'))
      poll2.add_vote(Vote.new('Dave', 'Bob'))

      result = poll2.count_votes

      expect(result['Alice']).to eq 0
      expect(result['Bob']).to eq 2
      expect(result.keys).to eq ['Bob', 'Alice']
    end
  end
end