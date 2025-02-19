require 'openai'

class OpenaiService
  def initialize
    puts "DEBUG: OPENAI_API_KEY=#{ENV['OPENAI_API_KEY']}"
    @client = OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'])
  end

  def suggest_cocktail(base, taste)
    prompt = "おすすめの#{base}ベースで#{taste}な味のアレンジカクテルを教えてください。レシピと作り方も教えてください。"

    response = @client.chat(
      parameters: {
        model: "gpt-4",
        messages: [{ role: "user", content: prompt }],
        temperature: 0.8
      }
    )

    response.dig("choices", 0, "message", "content")
  end
end