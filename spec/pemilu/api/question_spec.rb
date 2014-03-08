require "spec_helper"

module Pemilu
  describe API do
    describe "#questions" do
      let(:pemilu) { Pemilu::API.new(key: "06ec082d057daa3d310b27483cc3962e") }

      it "should return an array of Pemilu::Question object" do
        pemilu.questions.should be_a(Array)
        pemilu.questions.each do |q|
          expect(q.class).to eq(Pemilu::Question)
        end
      end

      let(:pemilu_invalid) { Pemilu::API.new(key:"xxx") }

      it "should return invalid request error " do
        expect(pemilu_invalid.questions).to eq("Invalid request error. Please check your API key")
      end
    end

    describe "#question(1)" do
      let(:pemilu) { Pemilu::API.new(key: "06ec082d057daa3d310b27483cc3962e")}

      it "should return an object of Pemilu::Question and have correct details" do
        q = pemilu.question("001")
        expect(q.id).to eq("001")
        expect(q.question).to eq("Apakah perempuan bisa mencalonkan diri dalam pemilu?")
        expect(q.answer).to eq("Ya, setiap warga negara indonesia baik perempuan maupun laki-laki memiliki hak untuk terlibat dalam pemerintahan")
        expect(q.reference_law).to eq("UUD 1945 Pasal 26 Ayat (1),")
        expect(q.excerpt_law).to eq("Pasal 26: (1) Yang menjadi warga negara ialah orang orang bangsa Indonesia asli dan orang orang bangsa lain yang disahkan dengan undangundang sebagai warga negara.")
        q.tags.should be_a(Array)
        expect(q.tags).to eq(["Perempuan", "Hak Asasi Manusia","Emansipasi","Women"])
      end

      it "should return Can't get Question with id: 'xxx'" do
        expect(pemilu.question("xxx")).to eq( "Can't get Question with id: xxx")
      end

      let(:pemilu_invalid) { Pemilu::API.new(key:"xxx") }

      it "should return invalid request error " do
        expect(pemilu_invalid.question("001")).to eq("Invalid request error. Please check your API key")
      end
    end

    describe "#questions(:tags)" do
      let(:pemilu) { Pemilu::API.new(key: "06ec082d057daa3d310b27483cc3962e")}

      it "should return an array of Pemilu::Question::Tag" do
        pemilu.questions(:tags).should be_a(Array)
        pemilu.questions(:tags).each do |t|
           expect(t.class).to eq(Pemilu::Question::Tag)
        end
      end
      let(:pemilu_invalid) { Pemilu::API.new(key:"xxx") }

      it "should return invalid request error " do
        expect(pemilu_invalid.questions(:tags)).to eq("Invalid request error. Please check your API key")
      end
    end

  end
end
