class WorksheetsController < ApplicationController
  def new
    @worksheet = Worksheet.new
  end

  def update
    @worksheet = Worksheet.find(params[:id])
    if @worksheet.update_attributes(params[:worksheet])
      redirect_to root_path
    else
      redirect_to root_path
      #flash "fail"
    end
  end

  def edit
    @worksheet = Worksheets.find(params[:id])
  end
  
  def show
    @worksheet = Worksheets.find(params[:id])
  end

  def destroy
  end

  def index
        @worksheets = Worksheet.all
  end

end
