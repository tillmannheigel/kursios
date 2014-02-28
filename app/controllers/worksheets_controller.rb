class WorksheetsController < ApplicationController
  #before_filter :authenticate_student!  
  before_filter :require_login, only: [:index, :show]
  before_filter :require_admin, only: [:new, :create, :update, :edit, :destroy]
  
  def new
    @worksheet = Worksheet.new
    @courses = Course.all
  end
  
  def create
    @myWorksheet = Worksheet.new(params[:worksheet].permit(:title,:max_points,:filling_date))
    @myWorksheet.course_id = params[:course][:course_id]
    if @myWorksheet.save
      redirect_to worksheets_path
    else
      #flash "fail"
      render "fail"
    end
  end

  def update
    @myWorksheet = Worksheet.find(params[:id])
    @myWorksheet.assign_attributes(params[:worksheet].permit(:title,:max_points,:filling_date))
    @myWorksheet.course_id = params[:course][:course_id]
    if @myWorksheet.save
      if !params[:worksheet][:data]
      redirect_to worksheets_path
      else
        addAttachmentToWorksheet @myWorksheet, params[:worksheet][:data]
      end
    else
      render "fail"
      #flash "fail"
    end
  end

  def edit
    @worksheet = Worksheet.find(params[:id])
    @courses = Course.all
  end
  
  def show
    @worksheet = Worksheet.find(params[:id])
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
    @worksheets = []
      if admin_signed_in?
        @worksheets = Worksheet.all
      elsif student_signed_in?
        @worksheets = current_student.all_worksheets
      end
  end
  
  def addAttachmentToWorksheet(worksheet, data)
    if worksheet.attachment.nil?
      @attachment = Attachment.new
    else
      @attachment = worksheet.attachment
    end
    @attachment.uploaded_file = data
    
        if @attachment.save
            worksheet.attachment = @attachment
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
   
end
