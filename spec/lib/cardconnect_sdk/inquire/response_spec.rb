require 'spec_helper'

module CardconnectSdk
  module Inquire
    RSpec.describe Response, type: :lib do
      it_behaves_like 'approved, retry, or declined'
    end
  end
end
