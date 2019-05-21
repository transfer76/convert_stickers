# coding: UTF-8
require 'telegram/bot'
require 'dotenv/load'

TOKEN = ENV['TELEGRAM_BOT_API_TOKEN'].freeze

Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |rqst|
    Thread.start(rqst) do |rqst|
      case rqst.text
      when '/start', '/start start'
        bot.api.send_message()
      end
    end
  end
end
