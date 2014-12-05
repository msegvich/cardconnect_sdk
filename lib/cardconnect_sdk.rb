require 'cardconnect_sdk/version'

module CardconnectSdk
  def self.root
    Pathname.new(File.dirname(__FILE__)).parent
  end

  autoload :Client,            'cardconnect_sdk/client'
end
