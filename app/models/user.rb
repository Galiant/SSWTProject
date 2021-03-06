class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, authentication_keys: [:login]
         
         validates :username, presence: :true, uniqueness: { case_sensitive: false }
         # Only allow letter, number, underscore and punctuation.
         validate :validate_username

        def validate_username
          if User.where(email: username).exists?
            errors.add(:username, :invalid)
          end
        end
         
         
         def user_params
           params.require(:user).permit(:email,:password_confirmation,:remember_me)
         end
         
         def login=(login)
           @login = login
         end

         def login
           @login || self.username || self.email
         end
         
         def self.find_for_database_authentication(warden_conditions)
          conditions = warden_conditions.dup
          if login = conditions.delete(:login)
            where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
          elsif conditions.has_key?(:username) || conditions.has_key?(:email)
            where(conditions.to_h).first
          end
         end
         
         has_many:orders
end
