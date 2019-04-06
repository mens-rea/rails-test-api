class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    # POST /users
    def create
      user = User.create!(user_params)
      if user.save
        render jsonapi: user
      else
        render jsonapi_errors: user.errors
      end
    end
    private
    def user_params
      # whitelist params
      params.require(:_jsonapi)
      .require(:data)
      .require(:attributes)
      .permit(:name, :email)
    end
end