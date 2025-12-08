class DocumentsController < ApplicationController
  def index
    @documents = Document.with_attached_file.order(created_at: :desc)
  end

  def create
    # Handle multiple file uploads
    if params[:files].present?
      params[:files].each do |file|
        doc = Document.new
        doc.file.attach(file)
        doc.save
      end
    end

    @documents = Document.with_attached_file.order(created_at: :desc)

    respond_to do |format|
      format.html { redirect_to root_path }
      format.turbo_stream
    end
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@document) }
    end
  end
end
