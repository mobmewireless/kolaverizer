class Kolaverizer
  class << self
    WHITELIST = ["Yo", "boys", "i", "were", "be", "holi", "it", "oh", 
      "you're", "the", "you", "are", "make", "take"  "am", "for", "a", 
      "to", "your", "maama", "moonu", "rhythm", "sariya", "vaasi", 
      "super", "dark"]
    
    def kolaverize(input_text)
      input_text.gsub!(/Hello/i, "Yo boys")
      input_text.gsub!(/Hey/i, "Yo boys")
      input_text.gsub!(/Hi/i, "Yo boys")
      input_text.gsub!(/I've been/i, "i am")
      input_text.gsub!(/I have been/i, "i am")
      input_text.gsub!(/I've/i, "i am")
      input_text.gsub!(/I have/i, "i am")
      input_text.gsub!(/moon/, "moonu")
      input_text.gsub!(/correct/, "sariya")
      input_text.gsub!(/holy/, "holi")
      
      input_text = suffix_u(input_text)
      input_text << "\nWhy this kolaveri kolaveri kolaveri di \nFlop song"
    end

    def suffix_u(input)
      Rails.logger.info "Input: #{input}"
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
end