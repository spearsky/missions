module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def gravatar_image_for_profile(user = current_user)
    gravatar_image_tag(user.email,
                       alt: "gravatar image",
                       class: "img-rounded gravatar",
                       gravatar: { size: 130 })
  end
end
