require 'rails_helper'

describe 'PATCH /posts/:id/publish' do
  subject { patch "/posts/#{ post.to_param }/publish"; response }

  let!(:owner) { create :user }
  let!(:other_user) { create :user }
  let!(:post) { create :post, user: owner }

  it_behaves_like "a video publish" do
    let(:video) { post }
  end

end
