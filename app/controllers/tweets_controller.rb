class TweetsController < ApplicationController
    def index
        @tweets = Tweet.all
        @users = User.all
    end
    def show
    end
    def new
    end
    def create
    end
    def edit
    end
    def destory
    end
    def update
    end
end
