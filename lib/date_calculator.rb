require 'date'

class DateCalculator
  def initialize
    @month_names = {
      "January" => 1,
      "February" => 2,
      "March" => 3,
      "April" => 4,
      "May" => 5,
      "June" => 6,
      "July" => 7,
      "August" => 8,
      "September" => 9,
      "October" => 10,
      "November" => 11,
      "December" => 12
    }
  end

  def today_date
    today = Date.today
    # Date.new(today.year, today.month, today.year)
  end

  def days_to_go_until(d, m)
    d = d.to_i
    m = @month_names[m]
    days = calculate_diff(Date.new(today_date.year, m, d), today_date)
    days = calculate_diff(Date.new((today_date.year + 1), m, d), today_date) if days < 0
    return days
  end

  private

  def calculate_diff(date_a, date_b)
    (date_a - date_b).to_i
  end

end