require "spec_helper"

module Pemilu
  describe API do
    describe "new" do
      let(:pemilu) { Pemilu::API.new(key: "06ec082d057daa3d310b27483cc3962e") }

      it "should an object" do
        pemilu.should be_a(Object)
      end
    end

    describe "#key" do
      let(:pemilu) { Pemilu::API.new(key: "06ec082d057daa3d310b27483cc3962e") }

      it "should return 06ec082d057daa3d310b27483cc3962e" do
        expect(pemilu.key).to eq("06ec082d057daa3d310b27483cc3962e")
      end
    end

  end
end
