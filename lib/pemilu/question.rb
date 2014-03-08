module Pemilu
  class Question

    attr_reader :id, :question, :answer, :reference_law, :excerpt_law, :tags

    def initialize(id: nil, question: nil, answer: nil, reference_law: nil, excerpt_law: nil, tags: nil)
      @id = id
      @question = question
      @answer = answer
      @reference_law = reference_law
      @excerpt_law = excerpt_law
      @tags = tags
    end

    class Tag
      attr_reader :title, :question_count
      def initialize(title: nil, question_count: nil)
        @title = title
        @question_count = question_count
      end
    end

  end
end
