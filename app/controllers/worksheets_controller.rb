class WorksheetsController < ApplicationController
  def new
    @worksheet = Worksheet.new
  end

  def update
    @new_worksheet = params[:id]
    @worksheet = Worksheet.find(params[:new_worksheet][:id])
    if @worksheet.update_attributes(params[:worksheet])
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
