class Employee < ActiveRecord::Base
  belongs_to(:list)
end
