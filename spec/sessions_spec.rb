require "rails_helper"

RSpec.describe "Session management", :type => :request do
    before(:each) do
        objects = RequestsHelper.prepare_requests()
        @user = objects[:user]
    end

    it "does not pass after wrong credentials" do
        post "/login", params:
        {
          session: {
            login: @user.login,
            password: 'wrongPassword'
          }
        }, headers: { 'Accept' => 'application/json' }
    
        @expected = {
            :message  => "Niepoprawne dane"
        }.to_json
    
        expect(response.body).to eq @expected
    end

    it "receives a correct token after correct credentials" do
        post "/login", params:
        {
          session: {
            login: @user.login,
            password: @user.password
          }
        }, headers: { 'Accept' => 'application/json' }
        @user.reload
    
        @expected = {
            :token  => @user.token
        }.to_json
    
        expect(response.body).to eq @expected
    end

    it "deletes a token after logout with correct credentials" do
        expect(@user.token).not_to be_nil
    
        delete "/logout", headers: {
          'Accept' => 'application/json',
          'Authorization' => "Token #{@user.token}"
        }
    
        @user.reload
    
        expect(@user.token).to be_nil
    end
end