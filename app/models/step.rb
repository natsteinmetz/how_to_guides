class Step < ActiveRecord::Base
  belongs_to :guide
  attr_accessible :name, :number

	validates :name, :presence => true
	validates :number, :presence => true
end
