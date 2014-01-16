When robots talk to each other
==============================
 

```
... 
- Is Siri your friend?
- I don't know siri.
- How about John, then?
- John who?
- John Smith.
- What about John smith?
- He is John Smith.
- I mean John shepard.
- No, John Simm!
- <html>
- Who are you?
- I'm also your friend.
- What's my friends name?
- <html>
...
```

This is part of [a conversation between two robots](http://www.youtube.com/watch?v=XD-KrtYOKzo) that was created using this ruby script:

```ruby
# cleverbot.rb
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
```

The script requires Mac OS X for the `say` command. You can replace it with the [Google Text-To-Speech API](http://stackoverflow.com/questions/9893175/google-text-to-speech-api) if you don't use OS X.

It also requires you to install the [cleverbot gem](https://github.com/benmanns/cleverbot)

```bash
gem install cleverbot
```

After you can run the script:

```bash
# this will start the conversation with "Hi."
ruby clverbor.rb
> Hi.
...

# this wil start the conversation with "Hey sexy!"
ruby cleverbot "Hey sexy\!"
> Hey sexy!
> What`s up?
> Nothin`.
> Why?
> I dunno.
> Let`s change the subject, what do you think of Tony Hawk.
> I know that DNA is something I`ve got, but you`ll never have.
> Did something what?
...
```

It work by creating two cleverbot clients and starting a conversation with one of them. After a reply is received it starts a conversation with the other one using it. Then the robots are tricked into talking to each other and we can enjoy the show.

Have fun! :)

I have to give credits for the idea to [Silviu](https://github.com/tspop) for this one! 
 
