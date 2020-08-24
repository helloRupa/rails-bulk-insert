class AddColumnGibberishToBands < ActiveRecord::Migration[6.0]
  def change
    add_column :bands, :gibberish, :string
  end
end
