class Band < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }, uniqueness: true
  validates :members, presence: true, numericality: { greater_than: 0 }

  def self.insert_all(records, options)
    normalized = normalize(records)

    super(normalized, options)
  end

  def self.normalize(records)
    records.each do |rec|
      add_timestamp(rec)
    end
  end

  def self.add_timestamp(record)
    time = Time.now.utc

    record['created_at'] = time
    record['updated_at'] = time
  end
end