class Band < ApplicationRecord
  include Insertable

  validates :name, presence: true, length: { minimum: 3 }, uniqueness: true
  validates :members, presence: true, numericality: { greater_than: 0 }

  after_validation :add_gibberish

  def add_gibberish
    self.class.make_gibberish(self)
  end

  def self.make_gibberish(record)
    record[:gibberish] = "#{record[:name]} likes gibberish"
  end

  def self.normalize(records)
    records.each do |rec|
      add_timestamp(rec)
      make_gibberish(rec)
    end
  end
end