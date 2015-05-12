require 'careerjet/constants'
require 'careerjet/errors'
require 'careerjet/client'
require 'careerjet/mash'
require 'careerjet/version'

class CareerjetApiClient

  attr_accessor :client

  def initialize(params)
    @client = Careerjet::Client.new(params) 
  end    

  def search(params)
    results = @client.search
    Careerjet::Mash.from_json results
  end
end
