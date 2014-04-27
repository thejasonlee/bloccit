class TopicPolicy < ApplicationPolicy
  #Default:=false; We set to true so topic indices are publicy accessible.
  def index?
    true
  end

  def create?
    user.present? && user.role?(:admin) #user.present? && (record.user == user || user.role?(:admin))
  end

  def update?
    create?
  end

  def show?
    record.public? || user.present?
  end
end