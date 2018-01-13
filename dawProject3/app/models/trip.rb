class Trip < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :nullify
	has_many :posts, dependent: :destroy
	has_many :trip_attachments
	accepts_nested_attributes_for :trip_attachments
	
	validates :from, :where, presence: {message:"El campo no puede estar vacío."}
  	scope :recent, ->{where("trips.start_date > ?", 6.months.ago).limit(3)}

	def owned_by?(owner)
	    return false unless owner.is_a? User
    	user == owner
	end
end
