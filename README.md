## Convert Stickers
This is simple Telegram bot to convert Telegram stickers to PNG files.

You choose any stickers in Telegram, pass on bot, and bot convert sticker from webp format to PNG format.
After that you can save new photo on your devise.

You can find this bot in Telegram, it name is **convert stickers**. After successful searching press **Start** and bot will greet you.
If you enter **/stop** the bot will say goodbye.

The bot implemented i language:

**Ruby** version **2.5.3**

#### Task completed as test
#### Requirements

Create Telegram chat bot.


Use Ruby and related technology stack to create simple Telegram bot to convert Telegram stickers to PNG files.

Requirements:
* Create Telegram bot with configurable ID.
* Implement long polling method to get updates from the API.
* Implement bot command /start. Bot should answer the description.
* When user send some text message, bot should response the warning message with small description.
* When user send some built-in Telegram sticker, bot should response same sticker as a PNG file.
* User should be able to save PNG to the device (phone, computer, etc).
* Use static code analyzer.
* Create Github repository with all code work and valid README file.

Additional score requirements:
* Cover all necessary code with unit tests.

Implementation details:
* Use last stable Ruby version.
* You can use any other gems you want, but make the choice reasonably.
* Write code as clean and as readable as possible.
* Consider using RSpec for testing.
* Consider using RuboCop as a static analyzer.
* Consider using GitFlow workflow.

### To Start Convert Stickers

Download or clone repository

Use bundle

```
$ bundle install
``` 

Create your own bot in Telegram using [@botfather](https://telegram.me/botfather)

You need receive your bot`s API Token like this:  125346270:AAHFF3ryDjYYg2dFB4nB1r0qn6za309EQhj

Create new file **.env**

```
$ touch .env
```

Insert received Token to new .env (see .env.exampl)

```
TELEGRAM_BOT_API_TOKEN = 125346270:AAHFF3ryDjYYg2dFB4nB1r0qn6za309EQhj
```

You can run the bot

```
$ ruby main.rb
```
