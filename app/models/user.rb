class User < ApplicationRecord
    before_save    :downcase_email

    # Validations
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates      :name,  presence: true, length: { maximum: 50  }
    validates      :email, presence: true, length: { maximum: 255 },
                           format: { with: VALID_EMAIL_REGEX },
                           uniqueness: true

    private

        def downcase_email
            self.email = email.downcase
        end
end
