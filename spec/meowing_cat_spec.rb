require_relative 'spec_helper'
require_relative '../lib/meowing_cat'

describe "Cat" do
  let(:maru) { Cat.new }  # Look up what let does in RSpec
  # https://www.relishapp.com/rspec/rspec-core/v/2-6/docs/helper-methods/let-and-let

  it 'instantiates a new cat' do
    expect(maru).to be_a(Cat)
  end

  it 'receives attr_accessor' do
    expect(Cat).to receive(:attr_accessor)
    load('meowing_cat.rb')
  end

  it 'has a name' do
    maru.name = "Maru"
    expect(maru.name).to eq("Maru")
  end

  it "is able to meow" do
    expect { maru.meow }.to output("meow!").to_stdout
  end
end
