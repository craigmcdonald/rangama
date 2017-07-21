require 'rails_helper'

describe HomeController, type: :controller do

  it { is_expected.to respond_to(:index) }
  it { is_expected.to respond_to(:search) }
  it { is_expected.to respond_to(:upload) }
  it { is_expected.to respond_to(:clear) }

  it 'should set a uuid cookie once' do
    get :index
    user = cookies['rangama_uuid']
    expect(user).to be
    get :index
    expect(user).to eq(cookies['rangama_uuid'])
  end

end
