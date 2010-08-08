class ApplicationController < ActionController::Base
  include UrlHelper
  protect_from_forgery
  before_filter :limit_subdomain_access

  protected

    def limit_subdomain_access
        if request.subdomain.present?
          # this error handling could be more sophisticated!
          # please make a suggestion :-)
          redirect_to root_url(:subdomain => false)
        end
    end

end
