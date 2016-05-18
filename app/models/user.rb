class User < ActiveRecord::Base

    has_many :articles
    has_secure_password

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :username,
        presence: true,
        length: {
            minimum: 3,
            maximum: 25
        },
        uniqueness: {
            case_sensitive: false
        }

    validates :email,
        presence: true,
        length: {
            maximum: 50
        },
        format: {
            with: VALID_EMAIL_REGEX
        },
        uniqueness: {
            case_sensitive: false
        }

    before_save {
        self.email = email.downcase
    }
end