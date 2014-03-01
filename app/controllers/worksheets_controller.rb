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
      if !params[:worksheet][:data]
      redirect_to worksheets_path
      else
        addAttachmentToWorksheet @myWorksheet, params[:worksheet][:data]
      end
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
      redirect_to worksheet_path(@myWorksheet)
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
    @courses = Course.all
    @attachment = @worksheet.attachment
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
            redirect_to worksheet_path(worksheet)
            flash[:notice] = "Thank you for your submission..."
            else
            redirect_to worksheet_path(worksheet)
            flash[:error] = "There was a problem storing your attachment."
            end
        else
            redirect_to worksheet_path(worksheet)
            flash[:error] = "There was a problem submitting your attachment."

        end 
    end
   
   def contribute
     worksheet = Worksheet.find(params[:id])
     contribution = Contribution.new
     contribution.notes = params[:notes]
     contribution.student = current_student
     attachment = Attachment.new
     attachment.uploaded_file = params[:data]
     if attachment.save
         attachment = contribution.attachments << attachment
         if contribution.save
         worksheet.contributions << contribution
         redirect_to worksheet_path(params[:id])
          flash[:notice] = "Thank you for your submission..."
         else
         redirect_to worksheet_path(worksheet)
         flash[:error] = "There was a problem submitting your attachment."
         end
   else
   redirect_to worksheet_path(worksheet)
   flash[:error] = "There was a problem submitting your attachment."
   end
   end
   
   def deleteAttachment
     attachment = Attachment.find(params[:id])
     contribution = attachment.attachable
     if admin_signed_in? || student_signed_in?&&(current_student == contribution.student)
       attachment.destroy
       if !(contribution.attachments.count > 0)
          contribution.destroy
       end
       redirect_to :back
       flash[:notice] = "Deleted"
     else
       redirect_to :back
       flash[:error] = "Not Deleted"
     end
   end
        
end
