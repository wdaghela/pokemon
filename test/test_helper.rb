ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors, with: :threads)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def index_url()
    return "/v1/pokemons"
  end

  def show_url(id)
    return "/v1/pokemons/#{@id.to_s}"
  end

  def update_url(id)
    return "/v1/pokemons/#{@id.to_s}"
  end
end
