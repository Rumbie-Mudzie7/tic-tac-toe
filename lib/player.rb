# frozen_string_literal: true

# rubocop:disable Style/Documentation

class Player
  attr_accessor :name, :mark

  def initialize(name, mark)
    @name = name
    @mark = mark
  end
end

# rubocop:enable Style/Documentation
