require 'spec_helper'

describe Song do
  before(:each) do
    @song = FactoryGirl.create(:song)
  end

  describe '#json_format' do
    it 'should get info of songs as hash' do
      @song.json_format.should be_kind_of(Hash)
    end

    it 'should return info of songs' do
      @song.json_format[:name].should == 'La Negra Tomasa'
    end
  end

  describe '#info' do
    it 
  end

end
