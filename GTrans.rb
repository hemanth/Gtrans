 require 'rubygems'  
 require 'xmpp4r-simple'  
 require 'open-uri'
 require 'net/http'
 require 'json'
 require 'httpclient'
 require 'dbm'
 require 'to_lang'

=begin
* Name:TransG 
* Description : Simple tanslate bot
* Author:Hemanth.HM <hemanth.hm@gmail.com>
* Date:1/1/2011
* License:GNU GPLv3
=end

class GTrans

    def initialize(bot_id,bot_password)
        # Initialize bot name and password
        @bot  = bot_id
        @pass = bot_password
        # Make a connection 
        @jabber = Jabber::Simple.new(@bot,@pass)
        # Set status message
        @jabber.status(:chat,"Translate")
    end
    
    def invoke(msg)
        # This method takes care of invokation of the required 
        # method from the factoid that the user throws at.
        
        # The below are the restricted methods, that must not be invoked
        restricted_methods=['main','invoke','deliver']
        # Get the method name from the chat msg
        meth=@msg.body.split()[0]
        # Remove the method name from the chat msg and save the rest
        @msg.body=@msg.body.sub(/\w+\s*/, '')
        if (self.respond_to?(meth) and !restricted_methods.include?(meth))
            # If the method to be invoked is present and is not a restricted one then invoke it.
            # Use obj.send(method,args) => method(args) similar to py's getattr
            self.send(meth,@msg)
        else
            # If not then alter the user of what he can do
            self.deliver(@msg,"I don't get what your are saying "+@msg.from.node+", but you can teach me @ https://github.com/hemanth/rgbot Try l33t <str>, goog <str>, xkcd, flip, flop, roll, greet, fortune, karma nick++/-- ")
        end
    end
    
    def deliver(msg,res)
        # A helper method to deliver the message to the one who pingged the bot
        # @msg.from.node would be the gmail user who is talking to the bot
        @jabber.deliver(@msg.from.node+"@gmail.com",res)
    end

    def help(msg)
        # This would deliver a simple help message for using the bot
        self.deliver(@msg,"Trans <str>")
    end
   
    def trans(msg)
        # Translate to spanish
        ToLang.start('GOOGLE_TRANSLATEAPI_KEY')
        puts @msg
        self.deliver(@msg,"*Afrikaans:* "+@msg.body.to_afrikaans_from_english)
        self.deliver(@msg,"*Albanian:* "+@msg.body.to_albanian_from_english)
        self.deliver(@msg,"*Arabic:* "+@msg.body.to_arabic_from_english)
        #self.deliver(@msg,"*Basque:* "+@msg.body.to_basque_from_english)
        self.deliver(@msg,"*Belarusian:* "+@msg.body.to_belarusian_from_english)
        self.deliver(@msg,"*Bulgarian:* "+@msg.body.to_bulgarian_from_english)
        self.deliver(@msg,"*Catalan:* "+@msg.body.to_catalan_from_english)
        self.deliver(@msg,"*Simplified_chinese:* "+@msg.body.to_simplified_chinese_from_english)
        self.deliver(@msg,"*Traditional_chinese:* "+@msg.body.to_traditional_chinese_from_english)
        self.deliver(@msg,"*Croatian:* "+@msg.body.to_croatian_from_english)
        self.deliver(@msg,"*Czech:* "+@msg.body.to_czech_from_english)
        self.deliver(@msg,"*Danish:* "+@msg.body.to_danish_from_english)
        self.deliver(@msg,"*Dutch:* "+@msg.body.to_dutch_from_english)
        #self.deliver(@msg,"*English:* "+@msg.body.to_english_from_english)
        self.deliver(@msg,"*Estonian:* "+@msg.body.to_estonian_from_english)
        self.deliver(@msg,"*Filipino:* "+@msg.body.to_filipino_from_english)
        self.deliver(@msg,"*Finnish:* "+@msg.body.to_finnish_from_english)
        self.deliver(@msg,"*French:* "+@msg.body.to_french_from_english)
        self.deliver(@msg,"*Galician:* "+@msg.body.to_galician_from_english)
        self.deliver(@msg,"*German:* "+@msg.body.to_german_from_english)
        self.deliver(@msg,"*Greek:* "+@msg.body.to_greek_from_english)
        self.deliver(@msg,"*Haitian_creole:* "+@msg.body.to_haitian_creole_from_english)
        self.deliver(@msg,"*Hebrew:* "+@msg.body.to_hebrew_from_english)
        self.deliver(@msg,"*Hindi:* "+@msg.body.to_hindi_from_english)
        self.deliver(@msg,"*Hungarian:* "+@msg.body.to_hungarian_from_english)
        self.deliver(@msg,"*Icelandic:* "+@msg.body.to_icelandic_from_english)
        self.deliver(@msg,"*Indonesian:* "+@msg.body.to_indonesian_from_english)
        self.deliver(@msg,"*Irish:* "+@msg.body.to_irish_from_english)
        self.deliver(@msg,"*Italian:* "+@msg.body.to_italian_from_english)
        self.deliver(@msg,"*Japanese:* "+@msg.body.to_japanese_from_english)
        self.deliver(@msg,"*Latvian:* "+@msg.body.to_latvian_from_english)
        self.deliver(@msg,"*Lithuanian:* "+@msg.body.to_lithuanian_from_english)
        self.deliver(@msg,"*Macedonian:* "+@msg.body.to_macedonian_from_english)
        self.deliver(@msg,"*Malay:* "+@msg.body.to_malay_from_english)
        self.deliver(@msg,"*Maltese:* "+@msg.body.to_maltese_from_english)
        self.deliver(@msg,"*Norwegian:* "+@msg.body.to_norwegian_from_english)
        self.deliver(@msg,"*Persian:* "+@msg.body.to_persian_from_english)
        self.deliver(@msg,"*Polish:* "+@msg.body.to_polish_from_english)
        self.deliver(@msg,"*Portuguese:* "+@msg.body.to_portuguese_from_english)
        self.deliver(@msg,"*Romanian:* "+@msg.body.to_romanian_from_english)
        self.deliver(@msg,"*Russian:* "+@msg.body.to_russian_from_english)
        self.deliver(@msg,"*Serbian:* "+@msg.body.to_serbian_from_english)
        self.deliver(@msg,"*Slovak:* "+@msg.body.to_slovak_from_english)
        self.deliver(@msg,"*Slovenian:* "+@msg.body.to_slovenian_from_english)
        self.deliver(@msg,"*Spanish:* "+@msg.body.to_spanish_from_english)
        self.deliver(@msg,"*Swahili:* "+@msg.body.to_swahili_from_english)
        self.deliver(@msg,"*Swedish:* "+@msg.body.to_swedish_from_english)
        self.deliver(@msg,"*Thai:* "+@msg.body.to_thai_from_english)
        self.deliver(@msg,"*Turkish:* "+@msg.body.to_turkish_from_english)
        self.deliver(@msg,"*Ukrainian:* "+@msg.body.to_ukrainian_from_english)
        self.deliver(@msg,"*Vietnamese:* "+@msg.body.to_vietnamese_from_english)
        self.deliver(@msg,"*Welsh:* "+@msg.body.to_welsh_from_english)
        self.deliver(@msg,"*Yiddish:* "+@msg.body.to_yiddish_from_english)

    end
                     
    def main
        # The main method meant to loop and recive msgs from the chat clinet
        while (true) do
             # An infinte loop to keep receving msgs  
             @jabber.received_messages do |@msg|
             # For each msg recevied do log it  
             File.open('log', 'w') {|log| log.write(@msg.from.node+" : "+@msg.body)}
             # Call the invoke method
             self.invoke(@msg)
           end
        end
        sleep(1) 
    end 
end

gtrans = GTrans.new('user@gmail.com','password')
gtrans.main()

