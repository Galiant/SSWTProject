class UserController < ApplicationController
    
    def login
        session[:login] = 1
        flash[:notice] = "you are logged in"
        redirect_to :controller => :items
        #session[:cart] = nil
    end
    def logout
        #in case things go crazy and impossible to understand uncomment the line below and logout /login 
        #session[:cart] = nil
        session[:login] = nil
        flash[:notice] = "Goodbye!"
        redirect_to :controller => :items
    end
end
