class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  def new
    @classified = Classified.find(params[:classified_id])
    @comment = Comment.new
  end

  def create
    @classified = Classified.find(params[:classified_id])
    @comment = Comment.new(comment_params)
    @comment.classified_id = @classified.id

    if params[:back]
      render :new
    elsif @comment.save
      redirect_to [@comment.classified.city, @comment.classified], notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to city_classified_path(@comment.classified.city, @comment.classified), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def confirm
    if request.post?
      @classified = Classified.find(params[:classified_id])
      @comment = Comment.new(comment_params)
      @comment.classified_id = @classified.id      
    else
      @comment = Comment.find(params[:id])
      @comment.attributes = comment_params
    end
    if @comment.valid?
      render :action => 'confirm'
    else
      render :action => request.post? ? 'new' : 'edit'
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:nickname, :email, :message, :classified_id)
    end
end
