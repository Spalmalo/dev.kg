shared_examples "a video publish" do

  context "when user is not signed in" do
    it { is_expected.to redirect_to sign_in_path }
  end

  context "when user is signed in" do

    context "when current user isn't video owner" do
      before { login_as other_user }

      it { is_expected.to be_forbidden }
    end

    context "when current user is video owner" do

      before { login_as owner }

      it { is_expected.to redirect_to video }
    end

  end
end