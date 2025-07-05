module TokenService
  class WebToken
    SECRET_KEY = Rails.application.secrets.secret_key_base.to_s.freeze

    class << self
      def encode(payload, exp = 24.hours.from_now)
        payload[:exp] = exp.to_i
        JWT.encode(payload, SECRET_KEY)
      end

      def decode(token)
        decoded_token = JWT.decode(token, SECRET_KEY).first
        HashWithIndifferentAccess.new(decoded_token)
      rescue JWT::ExpiredSignature => e
        Rails.logger.error "JWT Expired Signature: #{e.message}"
        nil
      rescue JWT::DecodeError => e
        Rails.logger.error "JWT Decode Error: #{e.message}"
        nil
      end
    end
  end
end
