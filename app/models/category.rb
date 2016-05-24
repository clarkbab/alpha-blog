class Category < ActiveRecord::Base

    validates :name,
        presence: true,
        length: {
            minimum: 3,
            maximum: 25
        },
        uniqueness: {
            case_sensitive: false
        }

    before_save {
        self.name = name.downcase
    }
end