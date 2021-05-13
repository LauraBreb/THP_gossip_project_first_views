class City < ApplicationRecord
  validates :name, presence: true
  validates :zip_code, presence: true
  has_many :users

  def find_gossips
    gossips = []
    users = self.users
    users.each do |user|
      gossips << Gossip.find_by(user_id: user.id)
    end
    return gossips
  end
end
