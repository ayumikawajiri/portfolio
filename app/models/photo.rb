class Photo < ApplicationRecord
  belongs_to :classified
  attachment :file
end
