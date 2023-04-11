class ConversationsController < ApplicationController
def index
  @conversations = Message.conversations

  render({ :template => "conversations/index.html.erb" })
  end
end 
