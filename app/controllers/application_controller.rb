class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Create a client object with your app credentials.
  client = Soundcloud.new(:client_id => 'ad246bea735d1371bb0416e34ec114a1')
  page_size = 50 #set page size limiting search results.

end
