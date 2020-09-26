class TweetsController < ApplicationController

  # GET /users/:user_id/tweets - As a unauthorized user I’m able to see a given user tweets
  #def index
   # json_response(@user.tweets)
  #end

  def index
  if params[:user_id].present?
    set_user
     json_response(@user.tweets)
  else
     @users = User.all
     #@tweets = Tweet.where(user_id: @users)
      #json_response(@tweets)
       @tweets = Tweet.all
    json_response(@tweets)
  end  
end

  # POST /users/:user_id/tweets - As a unauthorized user I’m able to create, show and delete tweets
  def create
    set_user
    @user.tweets.create!(tweet_params)
    json_response(@user, :created)
  end


  # DELETE /users/:user_id/tweets/:id - As a unauthorized user I’m able to create, show and delete tweets
  def destroy
    set_user
    set_user_tweet
    @tweet.destroy
    head :no_content
  end

  # GET /users/:user_id/tweets/:id - As a unauthorized user I’m able to create, show and delete tweets
  def show
    set_user
    set_user_tweet
    json_response(@tweet)
  end

  private

  def tweet_params
    params.permit(:text)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_user_tweet
    @tweet = @user.tweets.find_by!(id: params[:id]) if @user
  end
end
