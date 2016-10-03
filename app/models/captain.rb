class Captain < ActiveRecord::Base
  has_many :boats
  has_many :classifications, through: :boats
  
  def self.catamaran_operators
    includes(boats: :classifications).where('classifications.name = ?', 'Catamaran').uniq
  end

  def self.sailors
    includes(boats: :classifications).where(classifications: {name: "Sailboat"}).uniq
  end

  def self.motorboat
    includes(boats: :classifications).where(classifications: {name: "Motorboat"}).uniq

  end

  def self.talented_seamen
    self.sailors.where(id: self.motorboat.pluck(:id))
  end

  def self.non_sailors
    where.not(id: self.sailors.pluck(:id))
  end

end
