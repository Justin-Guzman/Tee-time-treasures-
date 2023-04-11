# == Schema Information
#
# Table name: messages
#
#  id           :integer          not null, primary key
#  body         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  listing_id   :integer
#  recipient_id :integer
#  sender_id    :integer
#
class Message < ApplicationRecord
  belongs_to(:sender, { :required => true, :class_name => "User", :foreign_key => "sender_id" })

  belongs_to(:recipient, { :required => true, :class_name => "User", :foreign_key => "recipient_id" })

  belongs_to(:listing, { :required => true, :class_name => "Listing", :foreign_key => "listing_id" })

  # TODO: verify the current_user should see these
  def Message.conversations
    select(:listing_id, :sender_id, :recipient_id)
      .distinct
      .map { |m| { listing_id: m.listing_id, user_ids: [m.sender_id, m.recipient_id].sort } }
      .uniq
      .map do |c|
        listing = Listing.find(c[:listing_id])
        users = c[:user_ids].map { |user_id| User.find(user_id) }
  
        messages = Message.where(listing_id: c[:listing_id], sender_id: c[:user_ids], recipient_id: c[:user_ids])
                          .order(created_at: :desc)
                          .to_a
  
        # Reverse the order of messages to show the latest first
        messages.reverse!
  
        # Combine the messages with the listing and users
        {
          listing: listing,
          users: users,
          messages: messages
        }
      end
  end
end
