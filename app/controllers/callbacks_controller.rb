class CallbacksController < Devise::OmniauthCallbacksController
    # uses OmniAuth to get user info from GitHub
    def github
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in_and_redirect @user
    end
end