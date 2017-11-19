class TodosController < ApplicationController
  before_action :set_todo, :only => [:edit, :update, :destroy]

  def index
    @todos = Todo.order(due_date: :asc)
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to todos_url
    else
      render :new
    end  
  end

  def update
    @todo.update(todo_params)

    redirect_to todos_url
  end

  def destroy
    if @todo.determine_destroy
      @todo.destroy
      redirect_to todos_url
    else
      flash[:alert] = 'Error destroy!'
    end  
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :due_date, :note)
  end

  def set_todo
  @todo = Todo.find(params[:id])
  end

end
