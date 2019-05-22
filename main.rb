# coding: UTF-8
require 'telegram/bot'
require 'dotenv/load'
require 'webp-ffi'

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
          # get sticker path(name) from hash
          sticker_path = bot.api.get_file(file_id: sticker.file_id)['result']['file_path']

          #get sticker webp format
          filename = File.expand_path(File.join(File.dirname(__FILE__), "pic.webp"))
          #get sticker png format
          out_filename = File.expand_path(File.join(File.dirname(__FILE__), "pic.png"))

          #write converted file
          File.write(filename, open("https://api.telegram.org/file/bot#{TOKEN}/#{sticker_path}").read)
          WebP.decode(filename, out_filename)

          bot.api.send_message(chat_id: rqst.chat.id, text: "Send for you converted sticker. You can save it on your devise")
              #send converted photo to chat
          bot.api.send_photo(chat_id: rqst.chat.id, photo: Faraday::UploadIO.new(out_filename, 'image/png'))
        else
          bot.api.send_message(chat_id: rqst.chat.id, text: "That was not a sticker....try again!")
        end
      end
    end
  end
end
