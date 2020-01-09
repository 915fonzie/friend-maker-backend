class User < ApplicationRecord
    acts_as_taggable
    acts_as_taggable_on :interests
    has_secure_password
end
