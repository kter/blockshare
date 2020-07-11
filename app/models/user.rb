class User < ApplicationRecord
  def self.from_omniauth(auth)
      create_from_omniauth(auth)
  end
    
  def self.create_from_omniauth(auth)
    find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["nickname"]
    end
  end
end
