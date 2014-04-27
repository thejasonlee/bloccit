class VotesPolicy < PostPolicy
  #If a user is present AND (created the record OR is an admin) then she can update
  def update?
    user.present? || user.role?(:admin)
  end
end