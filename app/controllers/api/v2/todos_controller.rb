class Api::V2::TodosController < ApplicationController
  def index
    #@todos = Todo.all
     render json: { message: 'Hello there'}, status: :ok
  end
end
