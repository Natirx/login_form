class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

 

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, default_url: lambda { |image| ActionController::Base.helpers.asset_path('missing.png') }
         validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
         crop_attached_file :avatar, :aspect => "16:9"
         
         
  


end
