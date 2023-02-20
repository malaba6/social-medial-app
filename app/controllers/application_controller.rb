class ApplicationController < ActionController::Base
  def hello
    render html: "Welcome to Social Media App"
  end
end
