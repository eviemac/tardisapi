module UsersHelper
  def join_tags(users)
    user.events.map { |t| t.username}.join(", ")
  end
end

# you may need to change user.events back to user.tags
