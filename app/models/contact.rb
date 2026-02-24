class Contact < ApplicationRecord
  validates :company_id, presence: true
end
