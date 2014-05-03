class CreateParentOfs < ActiveRecord::Migration
  def change
    create_table :parent_ofs, :force => true, :id => false do |t|
      t.integer "parent_id", :null => false
      t.integer "child_id", :null => false
      t.timestamps
    end
  end



end
