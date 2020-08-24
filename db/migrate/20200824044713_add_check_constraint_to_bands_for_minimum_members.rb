class AddCheckConstraintToBandsForMinimumMembers < ActiveRecord::Migration[6.0]
  def change
    execute <<-SQL
      ALTER TABLE bands
        ADD CONSTRAINT check_minimum_number_of_band_members
        CHECK (members > 0)
    SQL
  end
end
