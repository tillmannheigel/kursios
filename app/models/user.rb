class User < ActiveRecord::Base  
 attr_accessible :email
   has_secure_password

  
end
