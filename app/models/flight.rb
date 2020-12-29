class Flight < ApplicationRecord
  belongs_to :from_airport, class_name: 'Airport'
  belongs_to :to_airport, class_name: 'Airport'

  def self.distinct_dates
    Flight.select(:start).distinct.pluck(:start)
  end
end
