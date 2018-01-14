class ClassifiedsController < ApplicationController
  before_action :set_classified, only: [:show, :edit, :update, :destroy]
  before_action :breadcrumb, only: [:index, :show, :edit, :category]


  def index
    #@city = City.find(params[:city_id])
    @classifieds = Classified.where(city_id: @city.id, type: params[:type])
                             .order(created_at: :desc).page(params[:page])
                             .includes(:city)
    @type = params[:type]
  end

  def show
  end

  def new
    @classified = Classified.new
    @classified.photos.build
    add_breadcrumb 'Classifieds'
  end

  def edit
  end

  def create
    new_params = classified_params
    new_params.delete :select_category_job
    new_params.delete :select_category_house
    new_params.delete :select_category_community
    updated_params =
      if classified_params[:type] == "job"
        new_params.merge(category: classified_params[:select_category_job])
      elsif classified_params[:type] == "house"
        new_params.merge(category: classified_params[:select_category_house])
      elsif classified_params[:type] == "community"
        new_params.merge(category: classified_params[:select_category_community])
      end

    @classified = Classified.new(updated_params)
    @classified.user_id = current_user.id
      if @classified.save
        redirect_to city_classified_confirm_path(@classified.city, @classified)
        #redirect_to [@classified.city, @classified], notice: 'Classified was successfully created.'
      else
        render :new
      end
  end

  def update
    new_params = classified_params
    new_params.delete :select_category_job
    new_params.delete :select_category_house
    new_params.delete :select_category_community
    updated_params =
      if classified_params[:type] == "job"
        new_params.merge(category: classified_params[:select_category_job])
      elsif classified_params[:type] == "house"
        new_params.merge(category: classified_params[:select_category_house])
      elsif classified_params[:type] == "community"
        new_params.merge(category: classified_params[:select_category_community])
      end

      if @classified.update(updated_params)
        redirect_to city_classified_confirm_path(@classified.city, @classified)
        #redirect_to [@classified.city, @classified], notice: 'Classified was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @classified.destroy
    redirect_to city_path(@classified.city), notice: 'Classified was successfully destroyed.'
  end


  def category
    @city = City.find(params[:city_id])
    @categories = Classified.where(city_id: @city.id, category: params[:category])
                            .order(created_at: :desc).page(params[:page])
                            .includes(:city)
    category_name = params[:category]

    case category_name
      when 'server'          then @category = 'Waiting Staff'
      when 'chef'            then @category = 'Chef'
      when 'kitchen_hand'    then @category = 'Kitchen Hand'
      when 'house_keeping'   then @category = 'Cleaning Staff'
      when 'barista'         then @category = 'Barista'
      when 'hairdresser'     then @category = 'Hairdresser'
      when 'sales_staff'     then @category = 'Sales Staff'
      when 'farmer'          then @category = 'Farmer'
      when 'job_other'       then @category = 'Other'
      when 'own'             then @category = 'Own Room'
      when 'living'          then @category = 'Living Share'
      when 'room'            then @category = 'Room Share'
      when 'house_other'     then @category = 'Other'
      when 'sports'          then @category = 'Sports'
      when 'music'           then @category = 'Music'
      when 'dance'           then @category = 'Dance'
      when 'cafe'            then @category = 'Cafe'
      when 'travel'          then @category = 'Travel'
      when 'english'         then @category = 'English Conversation'
      when 'community_other' then @category = 'Other'
    end
  end

  def confirm
    @classified = Classified.find(params[:classified_id])
  end

  private
    def set_classified
      @classified = Classified.find(params[:id])
    end

    def breadcrumb
      @city = City.find(params[:city_id])
      add_breadcrumb @city.state, state_path(@city, state: @city.state)
      add_breadcrumb @city.name, city_path(@city)
      add_breadcrumb 'Classifieds'
    end

    def classified_params
      params.require(:classified).permit(:title, :content, :category, :type, :user_id, :city_id, :select_category_job, :select_category_house, :select_category_community, photos_files: [])
    end
end
