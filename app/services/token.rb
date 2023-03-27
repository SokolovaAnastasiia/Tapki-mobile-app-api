class Token
    SECRET_KEY = Rails.application.secrets.secret_key_base.to_s
  
    def self.encode(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, SECRET_KEY)
    end
  
    def self.decode(token)
      decoded = JWT.decode(token, SECRET_KEY).first
      HashWithIndifferentAccess.new(decoded)
    rescue JWT::DecodeError => e
      Rails.logger.error "JWT decode error: #{e.message}"
      nil
    end
  end
  