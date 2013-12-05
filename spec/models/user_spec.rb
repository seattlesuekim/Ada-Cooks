require 'spec_helper'

describe User do 
  it "has a valid factory" do
    Factory.create(:user).should be_valid
  end
end
