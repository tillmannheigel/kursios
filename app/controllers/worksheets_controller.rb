class WorksheetsController < ApplicationController
  #before_filter :authenticate_student!  
  before_filter :require_login, only: [:index, :show]
  before_filter :require_admin, only: [:new, :create, :update, :edit, :destroy]
  
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
            redirect_to worksheet_path
            flash[:notice] = "Thank you for your submission..."
            else
            redirect_to worksheet_path
            flash[:error] = "There was a problem storing your attachment."
            end
        else
            redirect_to worksheet_path
            flash[:error] = "There was a problem submitting your attachment."

        end
        
    end
    
    def require_login
      unless student_signed_in? || admin_signed_in?
        redirect_to  new_student_session_path
        flash[:error] = "Bitte erst einloggen!"
      end
    end
    
    def require_admin
      unless admin_signed_in?
        redirect_to root_path
        flash[:error] = "Bitte als Admin anmelden!"
      end
    end
   
end
