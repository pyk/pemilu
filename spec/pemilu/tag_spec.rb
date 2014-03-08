require "spec_helper"

module Pemilu
  describe Question::Tag do
     let(:tag) { Pemilu::Question::Tag.new(title: "test", question_count: 1)}

     it "should have correct details" do
       tag.should be_a(Pemilu::Question::Tag)
       expect(tag.title).to eq("test")
       expect(tag.question_count).to eq(1)
     end
  end
end
