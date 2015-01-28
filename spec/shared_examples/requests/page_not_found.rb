shared_examples "a 'page not found' error page" do
  it "should have 404 status" do
    expect(response.status).to eq 404
  end

  it "should have proper error title" do
    expect(response.body).to include I18n.t('pages.not_found')
  end
end