class NewslettersController < ApplicationController

  def index
    @newsletters = Newsletter.order_by([:sent_on, :asc])
  end

  def show
    @newsletter = Newsletter.find(params[:id])
  end

  def new 
    @newsletter = Newsletter.new
  end

  def newsletters_params
    params.require(:newsletter).permit(:id, :content, :sent_on, :users_count)
  end

  def create 
    @newsletter = Newsletter.new(newsletters_params)
    if @newsletter.save
      redirect_to newsletters_path
    else
      render action: 'new'
    end
  end

  def edit
    @newsletter = Newsletter.find(params[:id])
  end

  def update
    @newsletter = Newsletter.find(params[:id])
    if @newsletter.update_attributes(newsletters_params)
      redirect_to newsletters_path
    else
      render action: 'edit'
    end
  end

  def destroy
    @newsletter = Newsletter.find(params[:id])
    @newsletter.destroy
    redirect_to newsletters_path
  end

end
