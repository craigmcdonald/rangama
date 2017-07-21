require 'rails_helper'

describe HomeHelper, type: :helper do
  # For some reason, helper is singular here, whereas it is helpers inside
  # the controller.
  subject { helper }
  it { is_expected.to respond_to(:previous_searches) }
  it { is_expected.to respond_to(:append_search) }
  it { is_expected.to respond_to(:clear_searches) }
  it { is_expected.to respond_to(:user) }
  it { is_expected.to respond_to(:upload_dictionary) }
  it { is_expected.to respond_to(:time_taken) }

end
