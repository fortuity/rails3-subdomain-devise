class SitesController < ApplicationController
  def show
    @site = Site.find_by_name!(request.subdomain)
  end

end
