class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
    print current_user[:id]
    puts "done, this is  what we are talking about"
    #exit
  end
end
