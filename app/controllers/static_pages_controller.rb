class StaticPagesController < ApplicationController

  before_filter :redirect_if_logged_in, :only => [:home]

  def home
  end

  def about
  end


def redirect_if_logged_in
    redirect_to(user_path(current_user)) if logged_in? # check if user logged in
end
end
