class BlogpostsController < ApplicationController

  def index
    @blogposts = Blogpost.all
  end

  def new
    @blogpost = Blogpost.new
  end

  def create
    @blogpost = Blogpost.new(params[:blogpost])
    @blogpost.save
  end

  def show
    @blogpost = Blogpost.find(params[:id])
  end

  def edit
    @blogpost = Blogpost.find(params[:id])
  end

  def update
    @blogpost = Blogpost.find(params[:id])
    if @blogpost.update_attributes(params[:blogpost])
      flash[:success] = "Profile updated!"
      redirect_to @blogpost
    else
      render 'edit'
    end
  end

  def destroy
    Blogpost.find(params[:id]).destroy
    flash[:success] = "User destroyed!"
    redirect_to blogpost_path
  end
end
