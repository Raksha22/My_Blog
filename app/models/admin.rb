class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :timeoutable
        #  :lockable, :timeoutable, :trackable and :omniauthable
end
