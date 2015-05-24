class Railtie < Rails::Railtie
  initializer 'spirit_fingers.initialize' do |app|
    silence_warnings do
      ::SpiritFingers.melody!(app)
    end
  end
end
