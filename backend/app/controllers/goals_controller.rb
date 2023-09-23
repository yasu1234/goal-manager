class GoalsController < ApplicationController
    # before_action :authenticate_user!

    def index
        @user = current_user

        if params[:keyWord].present? 
            @goals = Goal.where("title LIKE ?", "%#{params[:keyWord]}%")
        else
            @goals = Goal.all
        end

        if params[:isMyGoal]
            @goals = @goals.where(create_user_id: @user.id)
        end

        if params[:startDate].present?
            @goals = @goals.where("start_date >= ?", params[:startDate])
        end

        if params[:endDate].present?
            @goals = @goals.where("end_date <= ?", params[:endDate])
        end

        render json: { goals: @goals }, status: 200
    end

    def create
        @user = current_user
        @goal = Goal.create(goal_params)
        @goal.create_user_id = @user.id
        @goal.start_date = Date.parse(params[:start_date]) if params[:start_date].present?
        @goal.end_date = Date.parse(params[:end_date]) if params[:end_date].present?
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
