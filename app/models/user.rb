class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  def self.search(query = nil)
    if query
      where(arel_table[:username].matches("#{query}%"))
        .or(where(arel_table[:first_name].matches("#{query}%")))
        .or(where(arel_table[:last_name].matches("#{query}%")))
    else
      all
    end
  end

  def name
    "#{first_name} #{last_name}"
  end
end
