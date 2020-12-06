class Vote
  attr_reader :voter, :candidate, :due_date
  def initialize(voter, candidate, due_date = 'custom date')
    @voter = voter
    @candidate = candidate
    @due_date = due_date
  end
end