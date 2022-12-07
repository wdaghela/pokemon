require "test_helper"

class V1::PokemonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pokemon = pokemons(:two)
  end

  test "Should get index" do
    get index_url
    assert_response :ok
  end


  test "Should show pokemon with specific id" do
    @pokemon.save
    get show_url(@pokemon.id)
    assert_response :ok
  end
end
