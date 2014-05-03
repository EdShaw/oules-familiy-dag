class Person < ActiveRecord::Base
  has_many :parent_ofs, :class_name => :ParentOf, :foreign_key => :parent_id, :dependent => :destroy
  has_many :child_ofs,  :class_name => :ParentOf, :foreign_key => :child_id,  :dependent => :destroy

  has_many :children, :through => :parent_ofs, :source => :child,  :dependent => :destroy
  has_many :parents,  :through => :child_ofs,  :source => :parent, :dependent => :destroy
end
