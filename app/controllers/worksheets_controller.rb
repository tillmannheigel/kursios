class WorksheetsController < ApplicationController
  def new
    @worksheet = Worksheet.new
  end

  def update
    @myWorksheet = Worksheet.find(params[:id])
    if @myWorksheet.update_attributes(params[:worksheet])
      redirect_to root_path
    else
      render "fail"
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
