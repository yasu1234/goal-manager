class TasksController < ApplicationController
    def create
        @user = current_user
        @goal = Task.create(task_params)
        @goal.create_user_id = @user.id
        @goal.save
        render json: { goal: @goal }, status: 200
    end

    def task_params
        params.permit(:title, :description, :goal_id, :start_date, :end_date, :create_user_id, :images)
    end
end