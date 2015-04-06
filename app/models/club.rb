class Club < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true
  validates :address, presence: true
  validates :description, presence: true, length: {minimum: 140}

  has_many :musics, dependent: :destroy
  has_many :features, dependent: :destroy
  has_many :clubevents, dependent: :destroy
  has_many :clublists

  # Paperclip config
  has_attached_file :logo, 
  url: "/assets/clubs/:id/:style/:basename.:extension"
  validates_attachment_presence :logo
  validates_attachment :logo, content_type: { content_type: 
    ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  has_attached_file :cover_image,
  url: "/assets/clubs/:id/:style/:basename.:extension"
  validates_attachment_presence :cover_image
  validates_attachment :cover_image, content_type: { content_type: 
    ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  #Geocoder
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  # FriendlyId config
  extend FriendlyId
  friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
    name_changed?
  end
end