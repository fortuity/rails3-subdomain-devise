class SitesController < ApplicationController
  skip_before_filter :limit_subdomain_access

  def show
    @site = Site.find_by_name!(request.subdomain)
  end

end
