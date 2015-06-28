require 'rails_helper'

describe PostArticle, type: :model do
  it { is_expected.to belong_to :post }

end