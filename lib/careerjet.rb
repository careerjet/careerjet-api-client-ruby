require 'careerjet/constants'
require 'careerjet/errors'
require 'careerjet/client'
require 'careerjet/mash'
require 'careerjet/version'

module Careerjet

  def self.search(params = {})
    results = Careerjet::Client.new(params).search

    Careerjet::Mash.from_json results
  end
end
