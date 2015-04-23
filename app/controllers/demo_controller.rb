class DemoController < ApplicationController
	layout 'application'
  def index
      redirect_to("hello")
  end 
  def hello
  
  end
end
