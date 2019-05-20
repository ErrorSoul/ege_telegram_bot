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
      question = 'Выберите вариант ЕГЭ (1 - 19) ?'
      bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
      answers =
        Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: [%w(A B), %w(C D)], one_time_keyboard: true)
    bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: answers)
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    end
  end
end
