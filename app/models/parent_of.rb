class ParentOf < ActiveRecord::Base
  belongs_to :parent, :class_name => :Person
  belongs_to :child, :class_name => :Person
  # set_primary_keys :parent_id, :child_id
end
