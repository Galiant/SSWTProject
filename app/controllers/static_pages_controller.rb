class StaticPagesController < ApplicationController
  def home
    
    @genres = Genre.all
    @consoles = Console.all
  end
  
  def about
  end

  def help
  end
  
  def paid
    flash[:notice] = "transaction complete"
    @order = Order.last
    @order.update_attribute(:status, "paid by user #{current_user.email}")
    session[:cart] = nil 
    
  end
  
  def console
    consoleName = params[:title]
    @consoleName = consoleName
    @items= Item.where("console like ?", consoleName)
  end
  
  def genre
     genreName = params[:title]
     @genreName = genreName
     @items = Item.where("genre like ?", genreName)
    #@items= Item.all
  end
  
end
