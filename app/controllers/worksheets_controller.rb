class WorksheetsController < ApplicationController
  def new
    @worksheet = Worksheet.new
  end

  def create
    @worksheet = Worksheet.create
    if @worksheet.save?
      redirect_to "root"
    else
      redirect_to "root"
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
