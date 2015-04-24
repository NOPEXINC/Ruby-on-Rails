class SectionsController < ApplicationController

    layout  "admin"
    def index
        @sections = Section.all
    end

    def show
        @section = Section.find(params[:id])
    end

    def new
        @section = Section.new
        @pages = Page.all
        @section_count = Section.count + 1
    end

    def create 
        @section = Section.create(section_params)

        if @section.save
            flash[:notice] = "#{@section.name} created succesfully"
            redirect_to(:action => 'index')
        else
            @pages = Page.all
            @section_count = Section.count + 1
            render('new')
        end

    end

    def edit
        @section = Section.find(params[:id]) 
        @section_count = Section.count
        @pages = Page.all
    end

    def update
        @section = Section.find(params[:id])

        if @section.update_attributes(section_params)
            flash[:notice] = "#{@section.name} updated succesfully"
            redirect_to(:action => 'index')
        else
            @pages = Page.all
            @section_count = Section.count
            render ('edit')
        end
    end

    def delete
        @section = Section.find(params[:id])
    end

    def destroy
        section = Section.find(params[:id])
        section.destroy
        flash[:notice] = "#{section.name} deleted succesfully"
        redirect_to(:action => 'index')
    end

    private 
    def section_params
        params.require(:section).permit(:page_id,:name,:position,:visible,:content_type,:content)
    end
end
