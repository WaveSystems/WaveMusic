require 'factory_girl'

FactoryGirl.define do
  factory :song do
    name "La Negra Tomasa"
    song { File.open(File.join(Rails.root, 'spec', 'assets', 'uploads', 'song', 'song','1','03_La_Negra_Tomasa_-_Single_Version.mp3')) }
  end
end
