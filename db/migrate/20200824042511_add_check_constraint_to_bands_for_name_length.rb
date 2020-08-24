class AddCheckConstraintToBandsForNameLength < ActiveRecord::Migration[6.0]
  def change
    execute <<-SQL 
      ALTER TABLE bands
       ADD CONSTRAINT check_minimum_length 
       CHECK (LENGTH(name) > 2)
    SQL
  end
end
