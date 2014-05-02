class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.references :parents, array: true, default: []
      t.references :person

      t.timestamps
    end
  end
end
