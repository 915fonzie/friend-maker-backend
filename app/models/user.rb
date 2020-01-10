class User < ApplicationRecord
    acts_as_taggable
    acts_as_taggable_on :interests
    validates :username, uniqueness: true
    validates :email, uniqueness: true
    has_secure_password
    

    def self.sort_users_from_greatest(users)
        users.sort_by {|user| -user.interest_list.length}
    end

    def self.sort_users_from_least(users)
        users.sort_by {|user| user.interest_list.length}
    end
end
