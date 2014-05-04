class ChangePOfsAddFKs < ActiveRecord::Migration
  def up
    execute 'ALTER TABLE parent_ofs '\
            'ADD CONSTRAINT fk_parent FOREIGN KEY (parent_id) '\
            'REFERENCES people (id)'

    execute 'ALTER TABLE parent_ofs '\
            'ADD CONSTRAINT fk_child FOREIGN KEY (child_id) '\
            'REFERENCES people (id)'

  end

  def down
    execute 'ALTER TABLE parent_ofs '\
            'DROP CONSTRAINT fk_parent '

    execute 'ALTER TABLE parent_ofs '\
            'DROP CONSTRAINT fk_child '

  end

end
