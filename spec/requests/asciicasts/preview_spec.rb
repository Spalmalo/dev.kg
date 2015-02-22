require 'rails_helper'

describe 'POST /asciicasts/preview' do
  subject { post "/asciicasts/preview", params, headers ; response }

  let(:params) { { asciicast: attributes_for(:asciicast, content: "# ASCIIcast test\nIt works!") } }
  let(:headers) { {} }

  context "when user is signed in" do
    let!(:user) { create :user }

    before { login_as user }

    context "when requested data type is HTML" do
      it { is_expected.to be_successful }

      it "should contain rendered asciicast" do
        expect(subject.body).to include "<h1>ASCIIcast test</h1>"
      end
    end

    context "when requested data type is JS" do
      let(:headers) { { "Accept" => "text/javascript" } }

      it { is_expected.to be_successful }

      it "should contain rendered asciicast" do
        expect(subject.body).to include '<h1>ASCIIcast test<\/h1>'
      end
    end

  end

  context "when user is not signed in" do

    it { is_expected.to redirect_to sign_in_path }

  end
end