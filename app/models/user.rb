class User < ApplicationRecord
    before_save    :downcase_email
    has_many       :reviews, dependent: :destroy

    # Validations
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates      :name,  presence: true, length: { maximum: 50  }
    validates      :email, presence: true, length: { maximum: 255 },
                           format: { with: VALID_EMAIL_REGEX },
                           uniqueness: true
    has_secure_password # converts password_digest into password and password confirmation
    validates      :password, presence: true, length: { minimum: 8 }, allow_nil: true

    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    private

        def downcase_email
            self.email = email.downcase
        end
end
