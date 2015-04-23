class SubjectsController < ApplicationController
  layout "admin"
  def index
   @subjects = Subject.order("position ASC")
   
  end
  
  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => 'Enter name',:visible => 'true'})
    @subject_count = Subject.count + 1
  end

  def create 
    @subject = Subject.new(subject_params)

    if @subject.save
      flash[:notice] ='Subject created succesfully'
      redirect_to ({:action => 'index'})
      
    else
      @subject_count = Subject.count + 1
      render('new')
    end

  end

  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(subject_params)
      flash[:notice] ='Subject Updated succesfully'
      redirect_to ({:action => 'index'})
    else
       @subject_count = Subject.count
      render('edit')
  end

  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    subject = Subject.find(params[:id])
    if subject.destroy
    flash[:notice] ='Subject deleted succesfully' 
    redirect_to({:action => 'index'})
    else
    render ('show')
    end
  end

 

  private 

  def subject_params

    params.require(:subject).permit(:name,:position,:visible)
  end
end
