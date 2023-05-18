class TweetsController < ApplicationController

    # インデックスページの表示。ツイートの一覧を表示する。
    def index
        @tweets = Tweet.all
    end

    # ツイートの詳細ページの表示。ツイートの詳細を表示する。
    def show
        set_tweet
    end

    # ツイートの新規投稿ページの表示。中身のないツイートのインスタンスを生成する。
    def new
        @tweet = Tweet.new
    end

    # ツイートの保存。ツイートの新規投稿フォームから送信されたデータを保存する。
    def create
        # フォームから送信されたデータを受け取り、ツイートのインスタンスを生成する。
        @tweet = Tweet.new(tweet_params)
        if @tweet.save
            # 保存できた場合はツイート一覧ページにリダイレクトする。
            redirect_to tweets_path
        else
            # 保存できなかった場合は新規投稿ページを再表示する。
            render :new
        end
    end

    # ツイートの編集ページの表示。ツイートの編集を行う。
    def edit
        set_tweet
    end

    # ツイートの更新。ツイートの編集フォームから送信されたデータを更新する。
    def update
        set_tweet
        if @tweet.update(tweet_params)
            redirect_to tweets_path
        else
            render :edit
        end
    end

    # ツイートの削除。
    def destroy
        set_tweet
        @tweet.destroy
        redirect_to root_path, status: :see_other
    end

    private
    # 送信されたパラメータのうち、ツイートのテキストのみを受け取る。
    def tweet_params
        params.require(:tweet).permit(:text)
    end

    # 該当のツイートを取得する。
    def set_tweet
        @tweet = Tweet.find(params[:id])
        
    end
end
