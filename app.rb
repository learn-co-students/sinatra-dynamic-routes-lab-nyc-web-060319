require_relative "config/environment"

class App < Sinatra::Base
  get "/reversename/:name" do
    params[:name].reverse
  end

  get "/square/:number" do
    num = params[:number]
    (num.to_i ** 2).to_s
  end

  get "/say/:number/:phrase" do
    repeated = ""
    params[:number].to_i.times do
      repeated += params[:phrase]
    end
    repeated
  end

  get "/say/:word1/:word2/:word3/:word4/:word5" do
    "#{params[:word1]} #{params[:word2]} #{params[:word3]} #{params[:word4]} #{params[:word5]}."
  end

  get "/:operation/:number1/:number2" do
    operation = params[:operation]
    num1 = params[:number1].to_i
    num2 = params[:number2].to_i
    if operation == "add"
      ans = num1 + num2
    elsif operation == "subtract"
      ans = num1 - num2
    elsif operation == "multiply"
      ans = num1 * num2
    elsif operation == "divide"
      ans = num1 / num2
    end
    ans.to_s
  end
end
