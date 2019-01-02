class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true  #can't have objects, don't have a table 
end
