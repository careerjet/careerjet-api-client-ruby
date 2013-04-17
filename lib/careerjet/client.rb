require 'rest_client'

module Careerjet
  class Client

    attr_accessor :params

    def initialize(params)
      @params = params

      set_locale
      check_params
    end

    def check_params
      unless Careerjet::LOCALES.keys.include?(@params[:locale])
        raise Careerjet::UnknownLocale, "Not supported locale '#{@params[:locale]}'" 
      end

      @params.each_key do |k|
        unless Careerjet::ALLOWED_FIELDS.include? k
          raise InvalidParam, "Unknown param key `#{k}'"
        end
      end
    end

    def search
      response  = RestClient.get [Careerjet::DOMAIN, 'search'].join('/'),  params: @params
      raise_errors response

      response.body
    end

    def set_locale
      @params[:locale] ||= :en_US
    end

    def raise_errors response
      case response.code.to_i
      when 400..405
        raise Careerjet::NotFoundError, "(#{response.code}): #{response.message}"
      when 500..503
        raise Careerjet::UnavailableError, "(#{response.code}): #{response.message}"
      end
    end

  end
end