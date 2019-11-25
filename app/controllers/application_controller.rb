class ApplicationController < ActionController::Base


before_action :configure_permitted_parameters,if: :devise_controller?
#devise利用の機能(ユーザー登録、ログイン認証など)が使われる場合、その前に
#configure_permitted_parametersはdeviseで利用できるパラメータを設定するという意味
	def after_sign_in_path_for(resource)
		# flash[:notice] = "Welcome! You have signed up successfully."
		user_path(resource)
	end

	def after_sign_out_path_for(resource)
		# flash[:notice] = "Signed out successfully."
		root_path
	end


protected #protected に設定されたメソッドは、
#そのメソッドを持つオブジェクトがselfである
#コンテキスト(メソッド定義式やinstance_eval)でのみ呼び出せます

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
		# devise_parameter_sanitizer.permit(:sign_in, keys: [:name])

	#このコードがあるのでログインの時のcreateはいらないよ
	#devise_parameter_sanitizer.permitでnameのデータ操作を許可するアクションメソッドが指定されている
	#今回はユーザ登録(sign_up)の際に、ユーザ名(name)のデータを操作が許可される
	end
end

