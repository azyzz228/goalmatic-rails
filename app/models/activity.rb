class Activity < ApplicationRecord
  belongs_to :challenge
  validates :amount, :numericality => { greater_than: 0 }
  
  before_update :delete_activity_from_challenge
  after_update :add_new_activity_to_challenge

  after_create :add_new_activity_to_challenge
  before_destroy :delete_activity_from_challenge

  def add_new_activity_to_challenge
    challenge.add_to_progress(self)
  end
  
  def delete_activity_from_challenge
    challenge.delete_from_progress(self)
  end 
end
