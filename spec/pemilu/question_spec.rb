require "spec_helper"

module Pemilu
  describe Question do
    describe "new" do
      let(:q) { Pemilu::Question.new(
        id: 1,
        question: "test",
        answer: "test",
        reference_law: "test",
        excerpt_law: "test",
        tags:["test", "test"] )}

      it "should become Pemilu::Question object and have correct details" do
        q.should be_a(Pemilu::Question)
        expect(q.id).to eq(1)
        expect(q.question).to eq("test")
        expect(q.answer).to eq("test")
        expect(q.reference_law).to eq("test")
        expect(q.excerpt_law).to eq("test")
        q.tags.should be_a(Array)
        expect(q.tags).to eq(["test", "test"])
      end
    end
  end
end
