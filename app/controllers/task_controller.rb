class TaskController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :find_task, only: [:show, :update, :destroy]

    def index
        @task = Task.all
        render json: @task
    end

    def show
        render json: @task
    end

    def create
        @task = Task.new(task_params)
        if @task.save
            render json: @task
        else
            render error: { error: 'Unable to create task.'}, status: 400
        end
    end

    def update
        if @task
            @task.update(task_params)
            render json: { message: 'Task successfully updated.' }, status: 200
        else
            render json: { error: 'Unable to update task.' }, status: 400
        end
    end
    
    def destroy
        if @task
            @task.destroy
            render json: { message: 'Task successfully deleted.' }, status: 200
        else
            render json: { error: 'Unable to delete task.' }, status: 400
        end
    end

    private

    def task_params
        params.require(:task).permit(:title, :description, :time, :checked)
    end

    def find_task
        @task = Task.find(params[:id])
    end
end
