class RopePatron < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'ヒモ' },
    { id: 3, name: 'パトロン' },
  ]
 
  include ActiveHash::Associations
  has_many :users
 
end