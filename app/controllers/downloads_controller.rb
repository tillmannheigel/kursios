class DownloadsController < ApplicationController
  
    def download
      @attachment = Attachment.find(params[:id])
      send_data @attachment.data, :filename => @attachment.filename, :type => @attachment.content_type
      #redirect_to :back
    end
end