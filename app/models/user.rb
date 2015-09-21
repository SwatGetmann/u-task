class User < ActiveRecord::Base
  has_many :tasks
  has_many :answers
  has_secure_password

  def self.from_omniauth(auth)
    find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
  end

  def self.from_identity(params)
    find_by(:provider => params[:provider], :email => params[:auth_key]) || create_with_identity(params)
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.rating = 0.0
      user.password = SecureRandom.urlsafe_base64(16)
    end
  end

  def self.create_with_identity(params)
    create! do |user|
      user.provider = params[:provider]
      user.name = params[:name]
      user.email = params[:email]
      user.rating = 0.0
      user.password = params[:password]
    end
  end

  def gave_correct_answer?(task)
    self.answers.find_by(:task => task, :correct => true)
  end

  def show_rating
    self.rating / self.answers.where(:correct => true).count
  end
    
end
