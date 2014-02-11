class WorksheetsController < ApplicationController
  def new
    @myWorksheet = Worksheet.new(params:worksheets)
    if @myWorksheet.save?
      redirect_to worksheets_path
    else
      #flash "fail"
      render "fail"
    end
  end

  def update
    @myWorksheet = Worksheet.find(params[:id])
    if @myWorksheet.update_attributes(params[:worksheets].permit(:title,:max_points,:filling_date))
      redirect_to worksheets_path
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
