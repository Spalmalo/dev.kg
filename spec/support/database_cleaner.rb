RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  # # Tag "uses_after_commit" helps when after_commit hook is expected
  # # to fire in a spec. It would never fire because of having enabled
  # # use_transactional_fixtures. It waits for transaction to end. The
  # # workaround disables transaction-wrapping for the tagged spec and
  # # instead uses a DatabaseCleaner strategy to wipe the tables here.
  # config.around(:each, :uses_after_commit) do |example|
  #   _orig_use_transactional_fixtures = use_transactional_fixtures
  #   self.use_transactional_fixtures = true
  #   DatabaseCleaner.clean_with(:truncation)
  #   example.call
  #   DatabaseCleaner.clean_with(:truncation)
  #   self.use_transactional_fixtures = _orig_use_transactional_fixtures
  # end

end