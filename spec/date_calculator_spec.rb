require 'date_calculator'
require 'date'

RSpec.describe DateCalculator do
  it 'provides the difference, in days, between a future date and today' do
    date_calculator = DateCalculator.new
    allow(date_calculator).to receive(:today_date).and_return(DateTime.new(2022, 3, 24))
    expect(date_calculator.days_to_go_until("24", "March")).to eq 0
    expect(date_calculator.days_to_go_until("25", "March")).to eq 1
    expect(date_calculator.days_to_go_until("26", "March")).to eq 2
    expect(date_calculator.days_to_go_until("24", "June")).to eq 92
  end

  context 'a date is given that has already passed this year' do
    it 'calculates the difference until the same date next year' do
      date_calculator = DateCalculator.new
      allow(date_calculator).to receive(:today_date).and_return(DateTime.new(2022, 3, 24))
      expect(date_calculator.days_to_go_until("8", "February")).to eq 321
    end
  end
end