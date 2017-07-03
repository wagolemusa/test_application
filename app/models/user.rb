class User < ActiveRecord::Base
	validates :username, presence: true,  
						uniqueness: { case_sensitive: false},
					 length: { minimum: 3, maximum: 25 } # it validates usernames

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
		#VALID_EMAIL_REGEX = /\A[+-]?\d+\z/

	validates :email, presence: true, length: { maximum: 105 },
						uniqueness:{ case_sensitive: false },
						format: { with: VALID_EMAIL_REGEX}

end