module DiscordHelper

  # andrew dev server details:
  #WEBHOOK_KEY = 'fR-Zaqg4Dl0D4Js2S0fSnt_85bA2PgD_wGSay9-lebENWtwK9zxL9pEsr_Fd0DYwv4Kg'.freeze
  #RECRUITMENT_CHANNEL_ID = '312590983835680780'.freeze

  WEBHOOK_KEY = 'vtQghPGDCARcFcFCDHHg7Wer0M8lifKTcQCqZRpbvmXWyApOxk9mXza9qFS_7VlJLe1g'.freeze
  RECRUITMENT_CHANNEL_ID = '312887430413942794'.freeze

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
