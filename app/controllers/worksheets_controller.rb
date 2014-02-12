class WorksheetsController < ApplicationController
  def new
    @worksheet = Worksheet.new
  end
  
  def create
    @myWorksheet = Worksheet.new(params[:worksheet].permit(:title,:max_points,:filling_date))
    if @myWorksheet.save
      redirect_to worksheets_path
    else
      #flash "fail"
      render "fail"
    end
  end

  def update
    @myWorksheet = Worksheet.find(params[:id])
    if @myWorksheet.update_attributes(params[:worksheets].permit(:title,:max_points,:filling_date))
      if !params[:worksheets][:data]
      redirect_to worksheets_path
      else
        addAttachmentToWorksheet @myWorksheet, params[:worksheets][:data]
      end
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
    if @worksheet.attachment_id
      @hasAttachment = true
      attachment = Attachment.find(@worksheet.attachment_id)
      @filename = attachment.filename
      @attachment_id = attachment.id
    else
      @hasAttachment = false
    end
  end

  def destroy
    @worksheet = Worksheet.find(params[:id])
    @worksheet.destroy
    redirect_to worksheets_path
  end

  def index
        @worksheets = Worksheet.all
  end
  
  def addAttachmentToWorksheet(worksheet, data)
    if !worksheet.attachment_id
      @attachment = Attachment.new
    else
      @attachment = Attachment.find(worksheet.attachment_id)
    end
    @attachment.uploaded_file = data
    
        if @attachment.save
            worksheet.attachment_id = @attachment.id
            if worksheet.save
            flash[:notice] = "Thank you for your submission..."
            redirect_to worksheet_path
            else
            flash[:error] = "There was a problem storing your attachment."
            redirect_to worksheet_path
            end
        else
            flash[:error] = "There was a problem submitting your attachment."
            redirect_to worksheet_path
        end
        
    end
   
end
