require 'careerjet/constants'
require 'careerjet/errors'
require 'careerjet/client'
require 'careerjet/mash'
require 'careerjet/version'

class CareerjetApiClient

  attr_accessor :careerjet_client

  def initialize(params)
    @careerjet_client = Careerjet::Client.new(params) 
  end    

  def search(search_params)
    results = @careerjet_client.search(search_params)
    Careerjet::Mash.from_json results
  end
end
