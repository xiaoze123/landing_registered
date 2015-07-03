
  class User < ActiveRecord::Base
    validates :name,  presence:true,uniqueness:{message:'already exist!',case_sensitive: false}#case_sensitive区分大小写
    def self.authenticate(name, password)
      user = User.find_by_name(name)

      # if user && Base64(password)== user.password
      #   return user
      # end
      # false
    end

    has_many :designs
    before_create { generate_token(:password) }
    before_create { generate_token(:password_digest) }

    def generate_token(column)
      begin
        self[column] = SecureRandom.urlsafe_base64
      end while User.exists?(column => self[column])
    end
  end
