class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  
  with_options presence: true do
    validates :sex_id
    validates :age
    validates :residence_id
    validates :rope_patron_id
  end

  with_options numericality: { only_integer: true } do
    validates :age
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sex
  belongs_to :residence
  belongs_to :rope_patron

  with_options numericality: { other_than: 1 } do
    validates :sex_id
    validates :residence_id
    validates :rope_patron_id
  end
end
