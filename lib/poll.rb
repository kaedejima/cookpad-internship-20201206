class Poll
  class InvalidCandidateError < StandardError

  end
  attr_reader :title, :candidates, :votes

  def initialize(title, candidates)
    @title = title
    @candidates = candidates
    @votes = []
  end

  def add_vote(vote)
    # if vote.candidate == 'INVALID'
    unless candidates.include?(vote.candidate)
      raise InvalidCandidateError
    end
    @votes.push(vote)
  end

  def count_votes
    result = {}
    candidates.each do |candidate|
      result[candidate] = 0
    end
    votes.each do |vote|
      result[vote.candidate] += 1
    end

    result.sort_by { |_key, value| value}.reverse.to_h
  end
end