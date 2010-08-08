class ApplicationController < ActionController::Base
  include UrlHelper
  protect_from_forgery
end
