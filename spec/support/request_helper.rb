# frozen_string_literal: true

module RequestHelper
  include Authenticable

  def authenticated_header(user)
    {
      Authorization: "Bearer #{encode(user_id: user.id)}"
    }
  end
end
