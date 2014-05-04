class ChangePOfPk < ActiveRecord::Migration
  def up
    execute "ALTER TABLE parent_ofs ADD CONSTRAINT pk_parent_child PRIMARY KEY (parent_id, child_id)"
  end

  def down
    execute "ALTER TABLE parent_ofs DROP CONSTRAINT pk_parent_child"
  end
end
