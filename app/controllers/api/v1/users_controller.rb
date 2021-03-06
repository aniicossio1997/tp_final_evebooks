module Api 
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: %i[show update destroy]
      before_action :check_owner, only: %i[update destroy show]
      # GET /users
      def index
        @users = User.all
        # render json: @users
        render json: UserSerializer.new(@users).serializable_hash
      end

      # GET /users/1
      def show
        #render json: @user
        options = { include: [:books] }
        render json: UserSerializer.new(@user, options).serializable_hash
      end

      # POST /users
      def create
        @user = User.new(user_params)
        
        if @user.save
          #render json: @user, status: :created
          render json: UserSerializer.new(@user).serializable_hash,status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /users/1
      def update
        if @user.update(user_params)
          #render json: @user, status: :ok
          render json: UserSerializer.new(@user).serializable_hash
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # DELETE /users/1
      def destroy
        @user.destroy
        head 204
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_user
          @user = User.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def user_params
          params.require(:user).permit(:email, :password, :password_digest,:name, :surname)
        end
        def check_owner
          head :forbidden unless @user.id == current_user&.id
        end
    end
  end
end