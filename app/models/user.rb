class User < ApplicationRecord
    before_save    :downcase_email

    # Validations
    validates      :name,  presence: true, length: { maximum: 50  }
    validates      :email, presence: true, length: { maximum: 255 }

    private

        def downcase_email
            self.email = email.downcase
        end
end
