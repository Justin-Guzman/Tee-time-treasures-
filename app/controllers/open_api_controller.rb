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
          messages: [{ role: "user", content: "Hello!"}], # Required.
          temperature: 0.7,
      })



    render({ :template => "open_api/results.html.erb"})
  end
end
