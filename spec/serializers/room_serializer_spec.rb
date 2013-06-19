require 'spec_helper'

describe RoomSerializer do
  let(:room) { FactoryGirl.build :room, id: 1 }
  let(:json) { RoomSerializer.new(room).to_json }

  subject { JSON.parse(json) }

  it { should be_a_room_representation(room) }
end
