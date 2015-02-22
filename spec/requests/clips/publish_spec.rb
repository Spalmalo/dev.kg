require 'rails_helper'

describe 'PATCH /clips/:id/publish' do
  subject { patch "/clips/#{ clip.to_param }/publish"; response }

  let!(:owner) { create :user }
  let!(:other_user) { create :user }
  let!(:clip) { create :clip, user: owner }

  it_behaves_like "a video publish" do
    let(:video) { clip }
  end

end
