require 'rails_helper'

describe 'POST /articles/preview' do
  subject { post "/articles/preview", params, headers ; response }

  let(:params) { { article: attributes_for(:article, content: "# Article markdown render test\nIt works!") } }
  let(:headers) { {} }

  context "when user is signed in" do
    let!(:user) { create :user }

    before { login_as user }

    context "when requested data type is HTML" do
      it { is_expected.to be_successful }

      it "should contain rendered article" do
        expect(subject.body).to include "<h1>Article markdown render test</h1>"
      end
    end

    context "when requested data type is JS" do
      let(:headers) { { "Accept" => "text/javascript" } }

      it { is_expected.to be_successful }

      it "should contain rendered article" do
        expect(subject.body).to include '<h1>Article markdown render test<\/h1>'
      end
    end

  end

  context "when user is not signed in" do

    it { is_expected.to redirect_to sign_in_path }

  end
end