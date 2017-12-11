class NoticesController < ApplicationController
  before_action :set_notice, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:new, :edit, :update, :destroy]

  add_breadcrumb "Notice", :notices_path

  def index
    @notices = Notice.order(created_at: :desc).page(params[:page])
  end

  def show
  end

  def new
    @notice = Notice.new
  end

  def edit
  end

  def create
    @notice = Notice.new(notice_params)
    @notice.user_id = current_user.id

    if params[:back]
      render :new
    elsif @notice.save
      redirect_to @notice, notice: 'Notice was successfully created.'
    else
      render :new
    end
  end

  def update
    if params[:back]
      render :edit
    elsif @notice.update(notice_params)
      redirect_to @notice, notice: 'Notice was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @notice.destroy
    respond_to do |format|
      format.html { redirect_to notices_url, notice: 'Notice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def confirm
    if request.post?
      @notice = Notice.new(notice_params)
      @notice.user_id = current_user.id
    else
      @notice = Notice.find(params[:id])
      @notice.attributes = notice_params
    end
    if @notice.valid?
      render :action => 'confirm'
    else
      render :action => request.post? ? 'new' : 'edit'
    end
  end

  private
    def set_notice
      @notice = Notice.find(params[:id])
    end

    def notice_params
      params.require(:notice).permit(:title, :content, :user_id)
    end

    def correct_user
      if user_signed_in?
        if current_user.admin?
        else
          redirect_to root_path        
        end
      else
        redirect_to new_user_session_path
      end
    end
end
