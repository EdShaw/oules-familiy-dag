class PersonNameNonNull < ActiveRecord::Migration
  def change
    change_column :people, :name, :string, :null => false
  end
end
