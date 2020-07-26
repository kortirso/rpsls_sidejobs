# frozen_string_literal: true

class Application
  class << self
    def root
      File.expand_path('..', __dir__)
    end

    def environment
      ENV['RACK_ENV'].to_sym
    end
  end
end
