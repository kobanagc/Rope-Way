class Reaciton < ApplicationRecord
  with_options presence: true do
    validates :from_user_id
    validates :to_user_id
  end
end
