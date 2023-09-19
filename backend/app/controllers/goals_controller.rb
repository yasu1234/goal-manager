class GoalsController < ApplicationController
    # before_action :authenticate_user!
    def create
        @user = current_user
        @goal = Goal.create(goal_params)
        @goal.create_user_id = @user.id
        @goal.save
        render json: { goal: @goal }, status: 200
    end

    def get
        @user = current_user
        @goal = Goal.where(create_user_id: @user.id)
        render json: { goal: @goal }, status: 200
    end

    def goal_params
        params.permit(:title, :description, :category_id, :start_date, :end_date, :create_user_id, :images)
    end
end
