class TweetsController < ApplicationController

  before_action :authenticate_user!

  # Get /tweets
  def index
    @tweets = Tweet.where(user_id: current_user.followings).order("tweets.created_at #{params[:order_by] || 'ASC' }")
    render json: { tweets: @tweets, serializer: TweetSerializer}, status: 200
  end

  # Post /tweets
  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      render json: { tweet: @tweet, serializer: TweetSerializer}, status: 200
    else
      render json: { error: @tweet.errors.full_messages}, status: 422
    end
  end

  # Get /user_tweets
  def user_tweets
    @tweets = current_user.tweets.order("tweets.created_at DESC")
    render json: { tweets: @tweets, serializer: TweetSerializer}, status: 200
  end

  private 

    def tweet_params
      params.require(:tweet).permit(:body)
    end
end