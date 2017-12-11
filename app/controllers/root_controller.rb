class RootController < ApplicationController
 
  def index
    @notices = Notice.all  	
    @information = Information.all
  end
end
