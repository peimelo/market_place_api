module Authenticable
  def current_user
    return @current_user if @current_user

    header = bearer_token
    return nil if header.nil?

    decoded = JsonWebToken.decode(header)

    @current_user = User.find(decoded[:user_id]) rescue ActiveRecord::RecordNotFound
  end

  private

  def bearer_token
    pattern = /^Bearer /
    header = request.headers["Authorization"]
    header.gsub(pattern, "") if header && header.match(pattern)
  end
end
