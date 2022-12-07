require "test_helper"

require 'faker'

class PokemonTest < ActiveSupport::TestCase
  setup do
    @pokemon = pokemons(:one)
  end

  test "pokemon should save" do
    assert @pokemon.save
  end

  test "Should not save with invalid records" do
    @pokemon.name =  ""
    assert_not @pokemon.save
  end

  test "Pokemon should update" do
    @pokemon.update(name:'hello', type1: 'one', type2: 'two')
    assert_equal(@pokemon.name,'hello') 
  end

  test "Pokemon should not update with empty name" do
    assert_not @pokemon.update(name: '')
  end

  test "Pokemon should delete" do
    assert @pokemon.destroy
  end
end
