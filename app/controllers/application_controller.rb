class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def current_site
    Website.find_by domain: current_domain
  end

  if Rails.env.production? || Rails.env.staging?
    def current_domain
      request.host
    end
  else
    def current_domain
      File.open(File.join(Rails.root, 'tmp', 'domain.txt'), 'r') { | f | f.read.strip }
    end
  end
end
