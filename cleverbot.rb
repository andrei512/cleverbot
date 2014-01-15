require 'cleverbot'
 
@client1 = Cleverbot::Client.new
@client2 = Cleverbot::Client.new
 
def say message, voice="Vicki"
  puts message
	`say -v #{voice} "#{message}"`
end
 
def chat alice, bob, message, first_voice="Vicki", second_voice="Zarvox"
	message = message.gsub("*","")
	say message, first_voice
	next_message = alice.write(message)
	chat bob, alice, next_message, second_voice, first_voice
end
 
chat @client1, @client2, ARGV.count > 0 ? ARGV[0] : "Hi."
