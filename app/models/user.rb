class User < ApplicationRecord
    before_save { self.email = email.downcase }
    # before_create :create_activation_digest
    validates :name,  presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },  
                      uniqueness: true
    
    
                      has_secure_password
                      validates :password, presence: true, length: { minimum: 6 }

                      def User.new_token
                        SecureRandom.urlsafe_base64
                      end
                      has_many :microposts, dependent: :destroy

end
