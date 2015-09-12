class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class User < ActiveRecord::Base
  has_many :tasks
  has_secure_password
  
  validates :name, presence: true
  # validates :email, presence: true, email: true
  validates :password, presence: true, length: { minimum: 6 }

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.password = SecureRandom.urlsafe_base64(n=6)
      user.rating = 0.0
    end
  end
end
