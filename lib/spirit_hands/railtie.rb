class Railtie < Rails::Railtie
  initializer 'spirit_hands.initialize' do |app|
    silence_warnings do
      require 'pry-rails'
      ::SpiritHands.melody!(app)
    end
  end
end # Railtie
