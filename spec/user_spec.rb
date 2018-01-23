require "rails_helper"

RSpec.describe "users", :type => :request do
  before(:each) do
    objects = RequestsHelper.prepare_requests()
    @user = objects[:user]
  end

  it "receives list of users" do
    get "/users", headers: {'Accept' => 'application/json'}
    expect(response).to have_http_status(200)
  end

  it "receives a particular user" do
    get "/users/#{@user.id}", headers: {'Accept' => 'application/json'}

    json = JSON(response.body)

    expect(json['id']).to eq(@user.id)
    expect(json['login']).to eq(@user.login)
    expect(response).to have_http_status(200)
  end

  it "creates a user" do
    post "/users", params:
    {
      user: {
        login: 'Alfred',
        password: 'password123'
      }
    }, headers: {'Accept' => 'application/json'}

    json = JSON(response.body)

    expect(response).to have_http_status(201)
    expect(json['login']).to eq('Alfred')
  end

  it "updates a user" do
    patch "/users/#{@user.id}", params:
    {
      user: {
        login: 'Henryk',
        password: 'password123'
      }
    }, headers: {'Accept' => 'application/json'}

    json = JSON(response.body)

    expect(response).to have_http_status(200)
    expect(@user.login).not_to eq(json['login'])
    @user.reload
    expect(@user.login).to eq(json['login'])
    expect(json['login']).to eq('Henryk')

  end

  it "deletes a user" do
    expect(User.exists?(@user.id)).to eq(true)
    delete "/users/#{@user.id}", headers:
    {
      'Accept' => 'application/json'
    }

    expect(response).to have_http_status(204)
    expect(User.exists?(@user.id)).to eq(false)
  end
end