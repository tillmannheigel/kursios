class DownloadsController < ApplicationController
  
    def download
      @attachment = Attachment.find(params[:data])
      send_data @attachment.data, :filename => @attachment.filename, :type => @attachment.content_type
      #redirect_to worksheet_path(params[:id])
    end
end