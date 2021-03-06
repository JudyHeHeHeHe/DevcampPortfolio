class PortfoliosController < ApplicationController
# before_action :set_portfolio_item, only: [:edit, :show, :update, :destroy]
layout "portfolio"
access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all


 def index
   # @portfolio_items = Portfolio.angular
   # @portfolio_items = Portfolio.ruby_on_rails_portfolio_items
   @portfolio_items = Portfolio.all
 end

 def angular
  @portfolio_items = Portfolio.angular
 end

 def new
  @portfolio_item = Portfolio.new
  3.times { @portfolio_item.technologies.build }
 end

 def create
  @portfolio_item = Portfolio.new(portfolio_params)

  respond_to do |format|
    if @portfolio_item.save
      format.html { redirect_to portfolios_path, notice: 'Your portfolio is now live.' }
    else
      format.html { render :new }
    end
  end
 end

 def edit
   @portfolio_item = Portfolio.find(params[:id])
 end

 def update
   @portfolio_item = Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Blog was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
   @portfolio_item = Portfolio.find(params[:id])
  end


  def destroy
    @portfolio_item = Portfolio.find(params[:id])
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio item was successfully destroyed.' }
     end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      technologies_attributes: [:name]
                                      )
  end
end
