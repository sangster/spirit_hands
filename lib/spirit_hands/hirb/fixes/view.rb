# Integrate Hirb + SpiritHands print output (AwesomePrint / inspect)
require 'hirb'
require 'spirit_hands'

class << Hirb::View
  def view_or_page_output(str)
    view_output(str) ||
      page_output(::SpiritHands::Print.pretty(str), true)
  end
end # Hirb::View.self
