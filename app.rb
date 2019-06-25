# 1. Create a dynamic route at `get '/reversename/:name'` that accepts a name and renders the name backwards.

# 2. Create a dynamic route at `get '/square/:number'` that accepts a number and returns the square of that number. **Note:** Remember that values in params always come in as strings, and your return value for the route should also be a string (use `.to_i` and `.to_s`).

# 3. Create a dynamic route at `get '/say/:number/:phrase'` that accepts a number and a phrase and returns that phrase in a string the number of times given.

# 4. Create a dynamic route at `get '/say/:word1/:word2/:word3/:word4/:word5'` that accepts five words and returns a string containing all five words 
# (i.e. `word1 word2 word3 word4 word5`).

# 5. Create a dynamic route at `get '/:operation/:number1/:number2'` that accepts an operation (add, subtract, multiply or divide) and performs the operation on the two numbers provided. For example, going to `/add/1/2` should render `3`.
require 'pry'

require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!
  get '/reversename/:name' do
    @user_name = params[:name]
    @user_name.reverse
  end

  get '/square/:number' do
    @num = params[:number].to_i 
    (@num**2).to_s
  end
  
  get '/say/:number/:phrase' do
    num = params[:number].to_i
    fin_string = ""
    (num).times do
      fin_string += "#{params[:phrase]}\n"
    end
    fin_string
  end
  
  get '/say/:word1/:word2/:word3/:word4/:word5' do
    "#{[params[:word1], params[:word2], params[:word3], params[:word4], params[:word5]].join(" ")}."
  end
  
  get '/:operation/:number1/:number2' do
    # binding.pry
    case params[:operation]

    when "add"
      [params[:number1].to_i, params[:number2].to_i].reduce(:+).to_s
    when "subtract"
      [params[:number1].to_i, params[:number2].to_i].reduce(:-).to_s
    when "multiply"
      [params[:number1].to_i, params[:number2].to_i].reduce(:*).to_s
    when "divide"
      [params[:number1].to_i, params[:number2].to_i].reduce(:/).to_s
    else
      "Unable to perform this operation"
    end
  end
end