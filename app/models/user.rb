
  class User < ActiveRecord::Base
    validates :name, uniqueness:{case_sensitive: false}
    validates  :name, :password,  presence: true



    def self.authenticate(name, password)
      user = User.find_by_name(name)
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

