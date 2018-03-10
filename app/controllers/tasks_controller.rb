class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: '登録完了'
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, notice: '更新完了'
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def task_params
    params.require(:task)
      .permit(
        :title,
        :description,
        :status,
        :priority,
        :deadline_at,
        :label
      )
  end
end
