class AttendancePolicy

  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @attendance = model
  end

  def index?
    @current_user.teacher?
  end

  def new?
    @current_user.teacher?
  end

  def edit?
    @current_user.teacher?
  end

  def show?
    @current_user.teacher?
  end

  def create?
    @current_user.teacher?
  end

  def update?
    @current_user.teacher?
  end

  def destroy?
    @current_user.teacher?
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      elsif user.restaurant_admin?
        scope.where(:addressable_id => user.restaurant_admins.select(:restaurant_id), :addressable_type => Restaurant.to_s)
      elsif user.user?
        scope.where(:addressable_id => user.id, :addressable_type => User.to_s)
      end
    end
  end

end