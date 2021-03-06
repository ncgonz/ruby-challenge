
describe 'calculating slugging percentage' do

  def GetStatistics (hits,doubles, triples, homeRuns, atBats)
    PlayerYearlyStatistics.new('player1','2009','NL','OAK','100',atBats,'5',hits,doubles,triples,homeRuns,'10','','', 'player1')
  end

  context 'all at-bats are home runs' do
    Given(:playerStats) {GetStatistics( '200','0','0','200','200')}

    When(:result) {playerStats.slugging_percentage}

    Then {expect(result).to eq(4)}
  end

  context 'no hits in 200 at bats' do
    Given(:playerStats) {GetStatistics( '0','0','0','0','200')}

    When(:result) {playerStats.slugging_percentage}

    Then {expect(result).to eq(0)}
  end

  context 'all 200 at bats are singles' do
    Given(:playerStats) {GetStatistics( '200','0','0','0','200')}

    When(:result) {playerStats.slugging_percentage}

    Then {expect(result).to eq(1)}
  end

  context 'half of the at bats are doubles and no other hits are recorded' do
    Given(:playerStats) {GetStatistics( '100','100','0','0','200')}

    When(:result) {playerStats.slugging_percentage}

    Then {expect(result).to eq(1)}
  end

  context 'no hits in 0 at bats' do
    Given(:playerStats) {GetStatistics( '0','0','0','0','0')}

    When(:result) {playerStats.slugging_percentage}

    Then {expect(result).to eq(0)}
  end
end