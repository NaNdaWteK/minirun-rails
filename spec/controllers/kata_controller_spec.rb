require 'rails_helper'

describe KatasController, type: :controller do
  context 'User not signed in' do
    it "edit response 302" do
      get :new
      expect(response.code).to eq '302'
    end
  end
end
