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
      if message.from.username == 'bitheway'
        reply.text = "I think that's an apt claim and a responsible answer! Great job Calire!"
      else
        reply.text = "I think that's an apt claim and a responsible answer! Great job #{message.from.first_name}!"
      end
    when /real/i
      reply.text = "Bot salifian is the only valid salifian"
    when /lynch/i
      if message.from.username == 'pearlkx'
        reply.text = "Of course ah lynch #{message.from.first_name}"
      else
        reply.text = "No la I wouldn't lynch #{message.from.first_name}, I think ah we should only lynch pearl"
      end
    when /contribute/i
      reply.text = "Feel free to contribute to SalifianBot here - https://github.com/jivesh/SalifianBot"
    else
      reply.text = if message.from.username == 'Salifian'
        "No upz for you #{message.from.first_name}"
      else
        "Upz la #{message.from.first_name}"
      end
    end
    reply.send_with(bot)
    puts "sending #{reply.text.inspect} to @#{message.from.username}"
  end
end
