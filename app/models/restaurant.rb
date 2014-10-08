class Restaurant < ActiveRecord::Base
	has_many  :reviews,     dependent: :destroy
	validates :name,        length: {minimum:3}, uniqueness: true
	validates :description, length: {minimum:1}
	validates :cuisine,     length: {minimum:1}   

	# Paperclip

has_attached_file :image,
                    styles: { medium: "300x300>",
                              thumb: "100x100>" },
                    default_url: "/images/:style/missing-restaurant.png",
                    storage: :s3,
                    s3_credentials: Proc.new{|a| a.instance.s3_credentials }
  
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


#   has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
# :default_url => "/images/:style/missing.png",
#                     :storage => :s3,
#                     :s3_credentials => Proc.new{|a| a.instance.s3_credentials},
#                     :url =>':s3_domain_url',
#     :path => '/:class/:attachment/:id_partition/:style/:filename'

  

  def s3_credentials
    {:bucket => "byverdu-yelp", :access_key_id => Rails.application.secrets[:access_key_id], :secret_access_key => Rails.application.secrets[:secret_access_key]}
  end


  # Average rating method

	def average_rating 
		return "N/A" if reviews.none?

		reviews.inject(0){ |memo, review| memo + review.rating } / reviews.length
		#reviews.average(:rating)
	end
end
