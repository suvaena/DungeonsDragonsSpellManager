class Book < ApplicationRecord
  has_and_belongs_to_many :spells  
  
  validates :name, uniqueness: true
  validates_presence_of :name
    
  def self.list
      listallarray = []
      Book.all.each do |x|
          listallarray.append(x.name)
      end
     return listallarray
  end
    
end
