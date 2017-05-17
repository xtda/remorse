module DiscordHelper

  # andrew dev server details:

  WEBHOOK_KEY = ENV['WEBHOOK_KEY']
  RECRUITMENT_CHANNEL_ID = ENV['RECRUITMENT_CHANNEL_ID']

  WEBHOOK_ENDPOINT = 'https://discordapp.com/api/webhooks'.freeze

  def send_test
    puts "Channel #{RECRUITMENT_CHANNEL_ID}"
    puts "Token: #{WEBHOOK_KEY}"
    send_message(RECRUITMENT_CHANNEL_ID, WEBHOOK_KEY, "**Hello Worlds**\n ***test***", "Remorse")
  end

  def send_to_recruitment_channel(content)
    send_message(RECRUITMENT_CHANNEL_ID, WEBHOOK_KEY, content)
  end

  private

  def send_message(channel, token, content, username = 'Remorse')
    RestClient.post("#{WEBHOOK_ENDPOINT}/#{channel}/#{token}",
                  { content: content, username: username }.to_json,
                  content_type: :json, accept: :json
                  )
  end
end

