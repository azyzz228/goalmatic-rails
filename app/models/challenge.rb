class Challenge < ApplicationRecord
  belongs_to :category, :dependent => :destroy
  has_many :activities, :dependent => :destroy
  validates :name, presence: true
  
  def add_to_progress(_new_activity)
    self.progress += _new_activity.amount;
    save
  end
  
  def delete_from_progress(_activity)
    activity = Activity.find(_activity.id)
    self.progress -= activity.amount;
    save
  end
  
end
