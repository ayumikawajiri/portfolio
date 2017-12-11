class City < ApplicationRecord
  has_many :classifieds, dependent: :destroy
  attachment :image

  validates :name, presence: true
  validates :introduction, presence: true
  validates :state, presence: true

  enum state: { NT: 0, NSW: 10, VIC: 20, QLD: 30, SA: 40, WA: 50, TAS: 60 }

  # def state_formal_name
  #   {
  #     NT: 'Northern Teritory',
  #     NSW: 'New South Wales',
  #     VIC: 'Victoria',
  #     QLD: 'Queensland',
  #     SA: 'South Australia',
  #     WA: 'West Australia',
  #     TAS: 'Tasmania'
  #   }[self.state.to_sym]
  # end

  def self.state_formal_names
    {
      NT: 'Northern Teritory',
      NSW: 'New South Wales',
      VIC: 'Victoria',
      QLD: 'Queensland',
      SA: 'South Australia',
      WA: 'West Australia',
      TAS: 'Tasmania'
    }
  end

end
