require 'kolaverizer'

class KolaverizeController < ApplicationController
  def kolaverizer
    @input = params[:input_text]
    unless @input.nil?
      @output = Kolaverizer.kolaverize(@input)
    end
  end  
end
