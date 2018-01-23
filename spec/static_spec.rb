require "rails_helper"

RSpec.describe "Static", :type => :request do
  before(:each) do
    objects = RequestsHelper.prepare_requests()
    @user = objects[:user]
  end

  it "receives a feed after correct token" do
    get "/feed", headers: {
      'Accept' => 'application/json',
      'Authorization' => "Token #{@user.token}"
    }

    # Konwertujemy JSON
    json = JSON(response.body)
    expect(response).to have_http_status(200)
    expect(json.keys).to contain_exactly('diaries', 'intakes')
  end

  it "leads to acces denied after wrong token" do
    get "/feed", headers: {
      'Accept' => 'application/json',
      'Authorization' => "Token wrongToken"
    }

    @expected = {
        :errors  => [{:detail => "Access denied"}]
    }.to_json

    expect(response).to have_http_status(500)
    expect(response.body).to eq @expected
  end
end