class OpenApiController < ApplicationController
  def create
    prompt = params[:question]
    model_engine = 'text-davinci-002'
    response = OpenAI::Completion.create(
      engine: model_engine,
      prompt: prompt,
      max_tokens: 1024,
      n: 1,
      stop: "\n"
    )
    answer = response.choices.first.text.strip
    render json: { answer: answer }
    
  end
  def index

    
  end
end
