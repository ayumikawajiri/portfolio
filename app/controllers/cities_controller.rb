class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:new, :edit, :update, :destroy]

  
  def index
    @cities = City.all
    add_breadcrumb "Cities"
  end

  def show
    add_breadcrumb @city.state, state_path(state: @city.state)
    add_breadcrumb @city.name, city_path
  end

  def new
    @city = City.new
  end

  def edit
  end

  def create
    @city = City.new(city_params)

    respond_to do |format|
      if @city.save
        format.html { redirect_to @city, notice: 'City was successfully created.' }
        format.json { render :show, status: :created, location: @city }
      else
        format.html { render :new }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @city.update(city_params)
        format.html { redirect_to @city, notice: 'City was successfully updated.' }
        format.json { render :show, status: :ok, location: @city }
      else
        format.html { render :edit }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @city.destroy
    respond_to do |format|
      format.html { redirect_to cities_url, notice: 'City was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def state_city
    @cities = City.where(state: params[:state])
    state_name = params[:state]
    
    case state_name
      when 'NT' then @state = 'Northern Teritory'
      when 'NSW' then @state = 'New South Wales'
      when 'VIC' then @state = 'Victoria'
      when 'QLD' then @state = 'Queensland'
      when 'SA' then @state = 'South Australia'
      when 'WA' then @state = 'West Australia'
      when 'TAS' then @state = 'Tasmania'
    end
    add_breadcrumb state_name
  end

  private
    
    def set_city
      @city = City.find(params[:id])
    end

    def city_params
      params.require(:city).permit(:name, :introduction, :state, :image_id)
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
