class Classified < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_many :comments, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :photos, dependent: :destroy
  accepts_attachments_for :photos, attachment: :file, append: true

  validates :title, presence: true
  validates :content, presence: true
  validates :category, presence: true
  validates :type, presence: true

  self.inheritance_column = :_type_disabled

  enum type: { job: 0, house: 10, community: 20 }

  enum category: { server: 100, chef: 110, kitchen_hand: 120, house_keeping: 130, barista: 140, hairdresser: 150, sales_staff: 160, farmer: 170, job_other: 199, 
  				         own: 200, living: 210, room: 220, house_other: 299,
  				         sports: 300, music: 310, dance: 320, cafe: 330, travel: 340, english: 350, community_other: 0
  					     }

  def category_job
    {
      server: 'Waiting Staff',
      chef: 'Chef',
      kitchen_hand: 'Kitchen Hand',
      house_keeping: 'Cleaning Staff',
      barista: 'Barista',
      hairdresser: 'Hairdresser',
      sales_staff: 'Sales Staff',
      farmer: 'Farmer',
      job_other: 'Other'
    }[self.category.to_sym]
  end

   def category_house
    {
      own: 'Own Room',
      living: 'Living Share',
      room: 'Room Share',
      house_other: 'Other'
    }[self.category.to_sym]
  end

  def category_community
    {
      sports: 'Sports',
      music: 'Music',
      dance: 'Dance',
      cafe: 'Cafe',
      travel: 'Travel',
      english: 'English Conversation',
      community_other: 'Other'
    }[self.category.to_sym]
  end

  def self.category_jobs
    {
      server: 'Waiting Staff',
      chef: 'Chef',
      kitchen_hand: 'Kitchen Hand',
      house_keeping: 'Cleaning Staff',
      barista: 'barista',
      hairdresser: 'hairdresser',
      sales_staff: 'Sales Staff',
      farmer: 'Farmer',
      job_other: 'Other'
    }
  end

   def self.category_houses
    {
      own: 'Own Room',
      living: 'Living Share',
      room: 'Room Share',
      house_other: 'Other'
    }
  end

  def self.category_communities
    {
      sports: 'Sports',
      music: 'Music',
      dance: 'Dance',
      cafe: 'Cafe',
      travel: 'Travel',
      english: 'English Conversation',
      community_other: 'Other'
    }
  end
end
