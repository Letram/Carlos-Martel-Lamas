class TripAttachmentsController < ApplicationController
  before_action :set_trip_attachment, only: [:show, :edit, :update, :destroy]

  # GET /trip_attachments
  # GET /trip_attachments.json
  def index
    @trip_attachments = TripAttachment.all
  end

  # GET /trip_attachments/1
  # GET /trip_attachments/1.json
  def show
  end

  # GET /trip_attachments/new
  def new
    @trip_attachment = TripAttachment.new
  end

  # GET /trip_attachments/1/edit
  def edit
  end

  # POST /trip_attachments
  # POST /trip_attachments.json
  def create
    @trip_attachment = TripAttachment.new(trip_attachment_params)

    respond_to do |format|
      if @trip_attachment.save
        format.html { redirect_to @trip_attachment, notice: 'Trip attachment was successfully created.' }
        format.json { render :show, status: :created, location: @trip_attachment }
      else
        format.html { render :new }
        format.json { render json: @trip_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trip_attachments/1
  # PATCH/PUT /trip_attachments/1.json
  def update
    respond_to do |format|
      if @trip_attachment.update(trip_attachment_params)
        format.html { redirect_to @trip_attachment, notice: 'Trip attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip_attachment }
      else
        format.html { render :edit }
        format.json { render json: @trip_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trip_attachments/1
  # DELETE /trip_attachments/1.json
  def destroy
    @trip_attachment.destroy
    respond_to do |format|
      format.html { redirect_to trip_attachments_url, notice: 'Trip attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip_attachment
      @trip_attachment = TripAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_attachment_params
      params.require(:trip_attachment).permit(:trip_id, :photo)
    end
end
