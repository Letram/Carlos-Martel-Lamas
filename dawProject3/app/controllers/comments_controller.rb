class CommentsController < ApplicationController

  before_action :load_trip, except: :destroy
  before_action :authenticate, only: :destroy

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = @trip.comments.new(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @trip, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
      @trip = current_user.trips.find_by_id(params[:trip_id])
    if @trip.nil?
       redirect_to :back, notice: "operación no permitida"
    end
    @comment = @trip.comments.find_by_id(params[:id])
    @comment.destroy
    redirect_to @trip, notice: "comentario eliminado"
  end

  private

    def load_trip
      @trip = Trip.find_by_id(params[:trip_id])
    end
    
    def comment_params
      params.require(:comment).permit(:title, :body)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end
end
