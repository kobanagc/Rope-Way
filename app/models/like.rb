class Like < ApplicationRecord
  with_options presence: true do
    validates :by_user_id
    validates :to_user_id
  end
end
