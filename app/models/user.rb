class User < ActiveRecord::Base
    # 1) says that this line is for first_name attribute/field validation
    # 2) and that a value HAS TO BE present:
    # validates :first_name, presence: true 
    # validates :last_name, presence: true # Add similar validation for another field
    # OR ALL in ONE LINE:
    # validates :first_name, :last_name, :email, presence: true

    # ADD LENGTH VALIDATION for both above fields:
    validates :first_name, :last_name, presence: true, length: { in: 2..20 }
    # ADD EMAIL VALIDATION 1) has to exist 2) NOT *case_sensitive* as 'uniqueness:' 3) *with:* REGEX as 'format': 
    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    validates :email, presence: true, uniqueness: {case_sensitive: false}, format: {with: EMAIL_REGEX}
end
