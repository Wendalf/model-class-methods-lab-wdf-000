class Classification < ActiveRecord::Base
  has_many :boat_classifications
  has_many :boats, through: :boat_classifications

  def self.my_all
    where(id: self.pluck(:id))
  end

  def self.longest
    Boat.order('length DESC').first.classifications
  end

end
