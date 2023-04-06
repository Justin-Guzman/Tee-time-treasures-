# == Schema Information
#
# Table name: listings
#
#  id          :integer          not null, primary key
#  description :string
#  image       :string
#  price       :string
#  status      :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  buyer_id    :integer
#  category_id :integer
#  seller_id   :integer
#
class Listing < ApplicationRecord
end
