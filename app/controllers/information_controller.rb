class InformationController < ApplicationController
  before_action :set_information, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:new, :edit, :update, :destroy]

  add_breadcrumb "Information", :information_index_path

  def index
    @information = Information.order(created_at: :desc).page(params[:page])
  end

  def show
  end

  def new
    @information = Information.new
  end

  def edit
  end

  def create
    @information = Information.new(information_params)
    @information.user_id = current_user.id

    if params[:back]
      render :new
    elsif @information.save
      redirect_to @information, notice: 'Information was successfully created.'
    else
      render :new
    end
  end

  def update
    if params[:back]
      render :edit
    elsif @information.update(information_params)
      redirect_to @information, notice: 'Information was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @information.destroy
    respond_to do |format|
      format.html { redirect_to information_index_url, notice: 'Information was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def confirm
    if request.post?
      @information = Information.new(information_params)
      @information.user_id = current_user.id
    else
      @information = Information.find(params[:id])
      @information.attributes = information_params
    end
    if @information.valid?
      render :action => 'confirm'
    else
      render :action => request.post? ? 'new' : 'edit'
    end
  end

  def category
    @information = Information.where(Information.arel_table[:category].matches(params[:category]))  
                             .order(created_at: :desc).page(params[:page])
    @category = params[:category]
  end

  private
    def set_information
      @information = Information.find(params[:id])
    end

    def information_params
      params.require(:information).permit(:title, :content, :category, :user_id)
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
