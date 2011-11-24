class KolaverizeController < ApplicationController

  input = "Hey Jude, don't make it bad
Take a sad song and make it better
Remember to let her into your heart
Then you can start to make it better

Hey Jude, don't be afraid
You were made to go out and get her
The minute you let her under your skin
Then you begin to make it better

And anytime you feel the pain, hey Jude, refrain
Don't carry the world upon your shoulders
For well you know that it's a fool who plays it cool
By making his world a little colder
Nah nah nah nah nah nah nah nah nah

Hey Jude, don't let me down
You have found her, now go and get her
Remember to let her into your heart
Then you can start to make it better

So let it out and let it in, hey Jude, begin
You're waiting for someone to perform with
And don't you know that it's just you, hey Jude, you'll do
The movement you need is on your shoulder
Nah nah nah nah nah nah nah nah nah yeah

Hey Jude, don't make it bad
Take a sad song and make it better
Remember to let her under your skin
Then you'll begin to make it
Better better better better better better, oh"

  WHITELIST = ["Yo", "boys", "i", "were", "be", "holi", "it", "oh", "you're", "the", "you", "are", "make", "take"  "am", "for", "a", "to", "your", "maama", "moonu", "rhythm", "sariya", "vaasi", "super", "dark"]

  def kolaverizer


    unless params[:input_text].nil?
      @input_text = params[:input_text]

      @input_text.gsub!(/Hello/i, "Yo boys")
      @input_text.gsub!(/Hey/i, "Yo boys")
      @input_text.gsub!(/Hi/i, "Yo boys")
      @input_text.gsub!(/I've been/i, "i am")
      @input_text.gsub!(/I have been/i, "i am")
      @input_text.gsub!(/I've/i, "i am")
      @input_text.gsub!(/I have/i, "i am")
      @input_text.gsub!(/Mother/, "Maama")
      @input_text.gsub!(/Mum/, "Maama")
      @input_text.gsub!(/mother/, "Maama")
      @input_text.gsub!(/mum/, "Maama")
      @input_text.gsub!(/moon/, "moonu")
      @input_text.gsub!(/correct/, "sariya")
      @input_text.gsub!(/holy/, "holi")

      @input_text = suffix_u(@input_text)
      @input_text << "\nWhy this kolaveri kolaveri kolaveri di \nFlop song"

      puts @input_text
    end
 
  end



  def suffix_u(input)
    input = input.squeeze(' ').split("\n").collect do |sentence|
      sentence.split(' ').collect do |word|
        unless WHITELIST.map(&:downcase).include?(word.downcase)
          word_sanitized = "#{word.gsub(/[^A-Z]/i, "")}"
          if ['d', 's', 'e'].include?(word_sanitized[-1])
            "#{word_sanitized}-la"
          else
            "#{word_sanitized}-u"
          end
        else
          "#{word}"
        end
      end.join(" ")
    end.join("\n")
    input.gsub(/\n\n/m, "\nWhy this kolaveri kolaveri kolaveri di!\n\n")
  end
end