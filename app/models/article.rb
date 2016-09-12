class Article < ApplicationRecord
  before_validation :give_category
  before_create :generate_url

  belongs_to :category

  validates :title, :email, presence: true
  validates :category, presence: true

  def give_category
    if self.category_id.nil?
      self.category_id = 1
    end
  end

  def generate_url
    random_code = SecureRandom.hex(10)
    self.link = random_code
  end
end
