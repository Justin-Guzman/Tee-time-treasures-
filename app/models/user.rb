# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  location        :string
#  name            :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:messages, { :class_name => "Message", :foreign_key => "sender_id", :dependent => :destroy })

  has_many(:message, { :class_name => "Message", :foreign_key => "recipient_id", :dependent => :destroy })

  has_many(:listings, { :class_name => "Listing", :foreign_key => "seller_id", :dependent => :destroy })

  has_many(:listing, { :class_name => "Listing", :foreign_key => "buyer_id", :dependent => :destroy })
end
