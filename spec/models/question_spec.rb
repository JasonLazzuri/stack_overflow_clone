require 'rails_helper'

describe Question do
  it 'is private by default' do
    question = FactoryGirl.create(:question)
    question.public?.should eq false
  end
  it 'converts the name to lowercase' do
    question = FactoryGirl.create(:question, :title => "Finagle the buffalo")
    question.title.should eq "finagle the buffalo"
  end
end
