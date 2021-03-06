class Author < ActiveRecord::Base
  validates :first_name, :last_name, :age, presence: true
  validates :first_name, :last_name, length: {in: 3...20}

  has_many :posts, dependent: :destroy
end
