require_relative "config/environment"

class App < Sinatra::Base
  get "/reversename/:name" do
    @name = params[:name]
    @name.reverse
  end

  get "/square/:number" do
    @num = params[:number]
    (@num.to_i * @num.to_i).to_s
  end

  get "/say/:number/:phrase" do
    @num = params[:number]
    @phrase = params[:phrase]
    str = ""
    @num.to_i.times do
      str += @phrase
    end
    str
  end

  get "/say/:word1/:word2/:word3/:word4/:word5" do
    word1 = params[:word1]
    word2 = params[:word2]
    word3 = params[:word3]
    word4 = params[:word4]
    word5 = params[:word5]
    "#{word1} #{word2} #{word3} #{word4} #{word5}."
  end

  get "/:operation/:number1/:number2" do
    operator_string = params[:operation]
    num1 = params[:number1]
    num2 = params[:number2]
    if operator_string == "add"
      (num1.to_i + num2.to_i).to_s
    elsif operator_string == "subtract"
      (num1.to_i - num2.to_i).to_s
    elsif operator_string == "multiply"
      (num1.to_i * num2.to_i).to_s
    else
      (num1.to_i / num2.to_i).to_s
    end
  end
end
