require 'rails_helper'

describe 'PATCH /screencasts/:id/publish' do
  subject { patch "/screencasts/#{ screencast.to_param }/publish"; response }

  let!(:owner) { create :user }
  let!(:other_user) { create :user }
  let!(:screencast) { create :screencast, user: owner }

  it_behaves_like "a video publish" do
    let(:video) { screencast }
  end

end
