require_relative 'spec_helper'
require_relative '../main'

describe 'Main' do

  it "should " do
    expect(telegram).to receive(:api)
    expect(api).to receive(:send_photo).with(chat_id: chat_id, photo: 'image')
    bot.send_image(image)
  end
end
