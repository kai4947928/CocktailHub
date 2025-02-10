class SessionsController < ApplicationController
	def failure
    flash[:alert] = "認証に失敗しました。"
    redirect_to root_path
  end
end
