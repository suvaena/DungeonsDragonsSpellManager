class Spell < ApplicationRecord
  has_and_belongs_to_many :books  
    
  validates_presence_of :name
  validates_uniqueness_of :name, case_sensitive: false, message: "cannot be the same as an existing spell. Case insensitive."
    
  validates_presence_of :level
  validates_numericality_of :level, only_integer: true, greater_than:-1, less_than: 10, message: "Must choose a level between 0-9"
  validates_presence_of :school, :presence => true
    
  validates :bard, inclusion: { in: [true, false] }
  validates :cleric, inclusion: { in: [true, false] }
  validates :druid, inclusion: { in: [true, false] }
  validates :paladin, inclusion: { in: [true, false] }
  validates :ranger, inclusion: { in: [true, false] }
  validates :sorcerer, inclusion: { in: [true, false] }
  validates :warlock, inclusion: { in: [true, false] }
  validates :wizard, inclusion: { in: [true, false] }
  
  validates_presence_of :concentration
  validates_presence_of :description
end
