class Read < ApplicationRecord
  belongs_to :link,  dependent: :destroy
end
