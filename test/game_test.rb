require_relative '../lib/game'
require "minitest/autorun"

describe Game do
  subject { Game.new }

  it "initializes the game correctly" do
    _( subject.instance_variable_get(:@screen) ).must_equal Array.new(8) {Array.new(8, ".")}
    _( subject.instance_variable_get(:@players) ).must_equal ["x", "o"]
    _( subject.instance_variable_get(:@current_player) ).must_equal "x"
  end


  it "switches the current player" do
    subject.send(:switch_player)
    assert_equal subject.instance_variable_get(:@current_player), 'o'
  end

it "displays the board" do
  assert_output(/12345678/) { subject.send(:display) }
end

 describe 'when validating column' do
  it 'must return the correct column' do
    subject.stub :gets, "1\n" do
      _(subject.send(:valid_column)).must_equal 0
    end
  end
end

describe 'when checking if game is won' do
  it 'must return true if game is won' do
    4.times { |i| subject.screen[7-i][0] = 'x' }
    _(subject.send(:won)).must_equal true
  end
end

describe "checking if the game is a draw"do
  it "must return true if the game is a draw" do
        subject.screen.each { |row| row.map! { 'x' }}
        _(subject.send(:draw)).must_equal true

  end
end



end
