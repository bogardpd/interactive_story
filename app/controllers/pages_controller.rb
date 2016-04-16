class PagesController < ApplicationController
  def home
    session[:new_page_number] = nil
  end
  
  def new
    @page_number = session[:new_page_number]
    redirect_to root_path if @page_number.nil?
    if (@page_number.to_i > 1 && Page.where(:page_num => (@page_number.to_i)/2).first.nil?)
      # Parent page does not exist, so don't create this page
      redirect_to root_path 
    end
    #session[:new_page_number] = nil
    
    @page = Page.new
    
  end
  
  def create
    @page_number = params['page_num']
    if (@page_number.to_i > 1 && Page.where(:page_num => (@page_number.to_i)/2).first.nil?)
      # Parent page does not exist, so don't create this page
      redirect_to root_path 
    end
    
    @page = Page.new(page_params)
    if @page.save
      redirect_to page_path(@page.page_num)
    else
      render 'new'
    end    
  end
  
  def show
    @page_number = params[:id]
    @page = Page.where(:page_num => @page_number).first
    raise ActiveRecord::RecordNotFound if (@page.nil?) #If this page number doesn't exist, send the user to create it.
    
    rescue ActiveRecord::RecordNotFound
      session[:new_page_number] = @page_number
      redirect_to new_page_path
  end
  
  private
  
    def page_params
      params.require(:page).permit(:page_num, :story_text, :choice_1, :choice_2)
    end
  
end
