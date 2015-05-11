require 'rest_client'

module Careerjet
  class Client

    attr_accessor :params

    def initialize(params)
      @params = params || {}

      set_locale
      check_params
    end

    def check_params

      unless Careerjet::LOCALES.keys.include?(@params[:locale_code])
        raise Careerjet::UnknownLocale, "Not supported locale '#{@params[:locale_code]}'" 
      end

      @params.each_key do |k|
        unless Careerjet::ALLOWED_FIELDS.include? k
          raise InvalidParam, "Unknown param key `#{k}'"
        end
      end

      unless @params[:affid]
        raise MandatoryParamMissing,"Mandatory param affid missing"
      end

      unless @params[:user_ip]
        raise MandatoryParamMissing,"Mandatory param user_ip missing"
      end

      unless @params[:user_agent]
        raise MandatoryParamMissing,"Mandatory param user_agent missing"
      end

    end

    def search
      response  = RestClient.get [Careerjet::DOMAIN, 'search'].join('/'),  params: @params
      raise_errors response

      response.body
    end

    def set_locale
      @params[:locale_code] = @params[:locale_code] || @params[:locale] || :en_GB
      @params.delete(:locale)
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
