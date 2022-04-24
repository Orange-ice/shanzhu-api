require 'rails_helper'

RSpec.describe "Items", type: :request do
  describe "index by page" do
    it "works! (now write some real specs)" do
      11.times {Item.create amount: 100}
      expect(Item.count).to eq(11)
      get api_v1_items_path
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)
      expect(json['resources'].length).to eq(10)
      get api_v1_items_path, params: {page: 2}
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)
      expect(json['resources'].length).to eq(1)
    end
  end

  describe "create" do
    it "can create a new item" do
      expect {
        post api_v1_items_path, params: {amount: 100}
      }.to change {Item.count}.by(1)
      expect(response).to have_http_status(201)
      json = JSON.parse(response.body)
      expect(json['resource']['amount']).to eq(100)
      expect(json['resource']['id']).not_to be_nil
    end
  end
end
