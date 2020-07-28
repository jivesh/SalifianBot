require 'telegram_bot'
require './secret.rb'
token = TELEGRAM_API_TOKEN
bot = TelegramBot.new(token: token)

bot.get_updates(fail_silently: true) do |message|
  puts "@#{message.from.username}: #{message.text}"
  command = message.get_command_for(bot)

  message.reply do |reply|
    case command
    when /start/i
      reply.text = "Let me tell you something, #{message.from.first_name}.\n\nYou are a good person."
    when /wisdom/i
      reply.text = "You see ah, gunnermen, sometime ah, things in life will be liddat one. Right? Understand ah #{message.from.first_name}"
    when /help/i
      reply.text = "See ah #{message.from.first_name}, when life gets me down, I watch my favorite band here https://youtu.be/pBuZEGYXA6E"
    when /supportme/i
      if message.from.username == "@bitheway"
        reply.text = "I think that's an apt claim and a responsible answer! Great job Calire!"
      else
        reply.text = "I think that's an apt claim and a responsible answer! Great job #{message.from.first_name}!"
      end
    when /lynch/i
      reply.text = "I think ah we should lynch pearl"
    when /real/i
      reply.text = "Bot salifian is the only valid salifian"
    when /lynch_beta_test/i
      if message.from.username == :@pearlkx
        reply.text = "yes lynch #{message.from.first_name}"
      else
        reply.text = "No la I wouldn't lynch #{message.from.first_name}"
      end
    else
      reply.text = "Upz la #{message.from.first_name}"
    end
    puts "sending #{reply.text.inspect} to @#{message.from.username}"
    reply.send_with(bot)
  end
end
