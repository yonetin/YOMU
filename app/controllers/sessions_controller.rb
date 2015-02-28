class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # ユーザーをサインインさせてユーザページ（show）にリダイレクトする
      sign_in user
      redirect_to user
    else
      # エラーメッセージを出してサインインフォームを再描画
      flash.now[:error] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
