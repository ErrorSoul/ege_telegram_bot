require 'rubygems'
require 'bundler/setup'
require 'telegram/bot'

token = ARGV.first
puts token
puts 'start'
Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    puts 'message'
    case message.text
    when '/start'
      puts 'starrrrrrrrrrrrrrrrrrrrrrrrt'
      bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    end
  end
end
