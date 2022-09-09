require 'rails_helper'

RSpec.describe Link, type: :model do
   it { should_not allow_value("Name").for(:url) } #validating format
   it { should validate_uniqueness_of(:encoded_string) }
   it { should validate_length_of(:url).is_at_least(3).is_at_most(255)
      .with_message(/Invalid URL Length/) }
   it { should validate_length_of(:encoded_string).is_at_least(3).is_at_most(255)
      .with_message(/Invalid URL Length/) }
end
