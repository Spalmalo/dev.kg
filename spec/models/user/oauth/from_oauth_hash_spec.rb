require 'rails_helper'

describe User, type: :model do
  subject { described_class.from_oauth_hash hash }

  let(:hash) {
    {
      "provider"=>"github",
      "uid"=>"123123123",
      "info"=>{
        "nickname"=>"shekelman",
        "email"=>"joseph@shekelman.com",
        "name"=>"Joseph Shekelman",
        "image"=>"https://avatars.githubusercontent.com/u/123123123?v=3",
        "urls"=>{
          "GitHub"=>"https://github.com/shekelman",
          "Blog"=>nil
        }
      }
    }
  }

  context "when user doesn't exist" do
    it "should create user" do
      expect { subject }.to change(User, :count).by 1
    end

    it "should return new user" do
      expect(subject).to eq User.last
    end

    describe "created user" do
      it "should have proper provider" do
        expect(subject.provider).to eq "github"
      end

      it "should have proper uid" do
        expect(subject.uid).to eq "123123123"
      end

      it "should have proper nickname" do
        expect(subject.nickname).to eq "shekelman"
      end

      it "should have proper name" do
        expect(subject.name).to eq "Joseph Shekelman"
      end

      it "should have proper email" do
        expect(subject.email).to eq "joseph@shekelman.com"
      end

      it "should have proper image" do
        expect(subject.image).to eq "https://avatars.githubusercontent.com/u/123123123?v=3"
      end

    end
  end

  context "when user exists" do
    let!(:user) { create :user, provider: "github", uid: "123123123", name: "Joseph Lol Shekelman" }

    it "should not create user" do
      expect { subject }.not_to change User, :count
    end

    it "should return existing user" do
      expect(subject).to eq user
    end

    describe "fetched user" do
      it "should have updated attributes" do
        expect(subject.name).to eq "Joseph Shekelman"
      end
    end
  end
end