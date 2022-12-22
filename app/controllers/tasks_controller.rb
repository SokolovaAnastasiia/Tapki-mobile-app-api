class TasksController < ApplicationController

    protect_from_forgery with: :null_session

    def index
        @tasks = Task.where(parent_id: nil)
        render json: @tasks
      end
      
    
    
    def show
        @task = Task.includes(:children).find(params[:id])
        render json: @task.as_json(include: :children)
    end

    def create

        authenticity_token = form_authenticity_token
        
        @task = Task.new(task_params)
        if @task.save
          render json: @task, status: :created
        else
          render json: @task.errors, status: :unprocessable_entity
        end
    end

    def update
        @task = Task.find(params[:id])
        if @task.parent.present?
          @task.parent.update(task_params)
        end
        if @task.update(task_params)
          render json: @task
        else
          render json: @task.errors, status: :unprocessable_entity
        end
      end
      
      def destroy
        @task = Task.find(params[:id])
        @task.destroy
        render json: { message: "Task successfully destroyed" }, status: :ok
      end
      
      
      
      private
      
      def task_params
        params.require(:task).permit(:name, :parent_id, :completed)
      end
      


end
