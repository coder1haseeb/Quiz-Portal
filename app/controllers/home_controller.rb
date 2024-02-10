class HomeController < ApplicationController
  def index
    @admins = User.admins
    @normalUsers = User.normalUsers
  end
end
