module Careerjet

  class UnknownLocale < ArgumentError; end
  class InvalidParam < ArgumentError; end

  class UnavailableError < StandardError; end
  class NotFoundError < StandardError; end

  class MandatoryParamMissing < ArgumentError; end
end
