module Authenticable
  def current_user
    return @current_user if @current_user

    header = bearer_token
    return nil if header.nil?

    decoded = JsonWebToken.decode(header)

    @current_user = User.find(decoded[:user_id])
    # @current_user = begin
    #                   p '==== 3'
    #                   User.find(39)
    #                 rescue StandardError
    #                   p '==== 4'
    #                   ActiveRecord::RecordNotFound
    #                 end
  end

  private

  def bearer_token
    pattern = /^Bearer /
    header = request.headers['Authorization']
    header.gsub(pattern, '') if header&.match(pattern)
  end

  protected

  def check_login
    # head :forbidden unless current_user.class == User
    current_user
  rescue ActiveRecord::RecordNotFound
    render json: {
      error: { message: 'RecordNotFound' }
    }, status: :forbidden
  rescue JWT::ExpiredSignature
    render json: {
      error: { message: 'ExpiredSignature' }
    }, status: :forbidden
  rescue JWT::VerificationError
    render json: {
      error: { message: 'VerificationError' }
    }, status: :forbidden
  end
end
