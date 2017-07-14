class TeachingsController < ApplicationController

  expose :teachings, -> { Teaching.where(:employee_id => current_user.id) }

  def index

  end

end
