# Integrate Hirb + SpiritFingers print output (AwesomePrint / inspect)
require 'hirb'
require 'spirit_fingers'

class << Hirb::View
  def view_or_page_output(str)
    view_output(str) ||
      page_output(::SpiritFingers::Print.pretty(str), true)
  end
end
