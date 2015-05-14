require 'careerjet/errors'
require 'careerjet/mash'
require 'careerjet/version'
require 'rest_client'
require 'careerjet/constants'
module Careerjet
  class APIClient 
    def initialize(params)
      @params = params || {}
      init_locale
      check_locale_param
    end    
  
    def check_locale_param
      unless Careerjet::LOCALES.keys.include?(@params[:locale_code])
        raise Careerjet::UnknownLocale, "Not supported locale '#{@params[:locale_code]}'"
      end
    end
    
    def search(search_params)
      @search_params = search_params || {}
      check_search_params(search_params)
      referer = @search_params.delete(:url)
      response  = RestClient.get [Careerjet::DOMAIN, 'search'].join('/'),  params: @search_params,:user_agent => 'careerjet-api-client-v' + Careerjet::APIClient.version + '-ruby-v' + RUBY_VERSION,:referer => referer
      raise_errors response
    
      results = response.body
      Careerjet::Mash.from_json results
    end
  
    def check_search_params(search_params)
      @search_params = search_params || {}
    
      #set search locale
      @search_params[:locale_code] = @search_params[:locale_code] || @search_params[:locale] || @params[:locale_code]
      @search_params.delete(:locale)
    
      @search_params.each_key do |k|
        unless Careerjet::ALLOWED_FIELDS.include? k
          raise InvalidParam, "Unknown param key '#{k}'"
        end
      end
    
      unless @search_params[:affid]
        raise MandatoryParamMissing,"Mandatory param 'affid' missing"
      end
    
      unless @search_params[:user_ip]
        raise MandatoryParamMissing,"Mandatory param 'user_ip' missing"
      end
    
      unless @search_params[:user_agent]
        raise MandatoryParamMissing,"Mandatory param 'user_agent' missing"
      end
    
      unless @search_params[:url]
        raise MandatoryParamMissing,"Mandatory param 'url' missing"
      end
    end
    
    def init_locale
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
