class SubdomainsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :find_user, :except => [:index, :show]
  respond_to :html

  def index
    @subdomains = Subdomain.all
    respond_with(@subdomains)
  end

  def show
    @subdomain = Subdomain.find(params[:id])
    respond_with(@subdomain)
  end

  def new
  @subdomain = Subdomain.new(:user => @user)
  respond_with(@subdomain)
  end

  def create
    @subdomain = Subdomain.new(params[:subdomain])
    if @subdomain.save
      flash[:notice] = "Successfully created subdomain."
    end
    redirect_to @user
  end

  def edit
    @subdomain = Subdomain.find(params[:id])
    respond_with(@subdomain)
  end

  def update
    @subdomain = Subdomain.find(params[:id])
    if @subdomain.update_attributes(params[:subdomain])
      flash[:notice] = "Successfully updated subdomain."
    end
    respond_with(@subdomain)
  end

  def destroy
    @subdomain = Subdomain.find(params[:id])
    @subdomain.destroy
    flash[:notice] = "Successfully destroyed subdomain."
    redirect_to @user
  end

  protected

    def find_user
      if params[:user_id]
        @user = User.find(params[:user_id])
      else
        @subdomain = Subdomain.find(params[:id])
        @user = @subdomain.user
      end
      unless current_user == @user
        redirect_to @user, :alert => "Are you logged in properly? You are not allowed to create or change someone else's subdomain."
      end
    end

end
