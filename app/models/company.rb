class Company < ApplicationRecord

  has_rich_text :description
  validate :verify_email, on: [:create, :update]
  before_save :set_city_state

  private

  def verify_email
    if email.present? && email.split("@").last != "getmainstreet.com"
      errors.add(:base, 'Sorry! At this point, only getmainstreet.com users can register a new company.')
    end
  end

  def set_city_state
    zipcode = ZipCodes.identify(zip_code)
    puts "zip code: #{zipcode}"
    if zipcode
      self.city = zipcode[:city]
      self.state = zipcode[:state_code]
		end
  end

end
