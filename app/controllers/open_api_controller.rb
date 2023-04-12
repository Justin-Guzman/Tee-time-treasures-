class OpenApiController < ApplicationController
  def index 

    render({ :template => "open_api/index.html.erb"})
  end

  def create
    @the_advice = params.fetch("advice")

    client = OpenAI::Client.new(access_token: "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")

    @response = client.chat(
      parameters: {
          model: "gpt-3.5-turbo", # Required.
          messages: [
            { role: "system", content: "You are a helpful assistant/instructor that has knowledge in golf equipment, and in the sport of golf."},
            { role: "user", content: @the_advice }
          ], # Required.
          temperature: 0.7,
      })

     @result = @response.fetch("choices").at(0).fetch("message").fetch("content")



    render({ :template => "open_api/results.html.erb"})
  end
end
