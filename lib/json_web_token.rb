class JsonWebToken
  SECRET_KEY = Rails.application.credentials.secret_key_base.to_i

  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    decode = JWT.decode(token, SECRET_KEY).first
    HashWithIndifferentAccess.new decode
  end
end