class TopicPolicy < ApplicationPolicy
  #Default:=false; We set to true so topic indices are publicy accessible.
  def index?
    true
  end

  #If a user is present AND (created the record OR is an admin) then she can update
  def update?
    user.present? && (record.user == user || user.role?(:admin))
  end
end