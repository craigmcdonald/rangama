require 'rails_helper'

describe HomeController, type: :controller do

  it { is_expected.to respond_to(:index) }
  it { is_expected.to respond_to(:search) }
  it { is_expected.to respond_to(:upload) }
  it { is_expected.to respond_to(:clear) }

end
