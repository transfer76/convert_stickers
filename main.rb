# coding: UTF-8
require 'telegram/bot'
require 'dotenv/load'

TOKEN = ENV['TELEGRAM_BOT_API_TOKEN'].freeze

Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |rqst|
    Thread.start(rqst) do |rqst|
      case rqst.text
      when '/start', '/start start'
        bot.api.send_message(chat_id: rqst.chat.id, text: "Hi, #{rqst.from.first_name} \nSend me sticker to get PNG file")
      when '/stop'
        bot.api.send_message(chat_id: rqst.chat.id, text: "Bye, #{rqst.from.first_name}")
      else
        sticker = rqst.sticker
        if sticker
          sticker_path = bot.api.get_file(file_id: sticker.file_id).file_path
          f = open("https://api.telegram.org/file/bot#{TOKEN}/#{sticker_path}")
          File.write('sticker.png', f.read)
          f.close
        else
          bot.api.send_message(chat_id: rqst.chat.id, text: "That was not a sticker....try again!")
        end
      end
    end
  end
end
