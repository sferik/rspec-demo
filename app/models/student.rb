class Student < ActiveRecord::Base
  attr_accessible :name, :course_id
  belongs_to :course
end
