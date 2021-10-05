class Connection < ApplicationRecord
  belongs_to :place
  belongs_to :exit
end
