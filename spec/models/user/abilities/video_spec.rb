require 'rails_helper'

describe User, type: :model do

  describe "abilities" do
    subject(:ability) { Ability.new(user) }

    let!(:user) { create :user }

    context "when user is persisted" do
      it { is_expected.to be_able_to(:read, Video) }
      it { is_expected.to be_able_to(:create, Video) }
    end

    context "when user isn't persisted" do
      let(:user) { User.new }

      it { is_expected.to be_able_to(:read, Video) }
      it { is_expected.not_to be_able_to(:create, Video) }
    end

    context "when video belongs to given user" do
      let!(:video) { create :screencast, user: user }

      it { is_expected.to be_able_to(:destroy, video) }

      it { is_expected.to be_able_to(:update, video) }
    end

    context "when video doesn't belong to given user" do
      let!(:video) { create :screencast }

      it { is_expected.not_to be_able_to(:destroy, video) }

      it { is_expected.not_to be_able_to(:update, video) }
    end
  end
end