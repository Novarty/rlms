module Teachers
  module Courses
    class GenerateSlug
      include Interactor

      delegate :course, to: :context

      def call
        return if course.slug.present?

        title = course.title.strip + Time.now.to_i
        course.slug = translit(title).gsub(/ /, '_')
      end

      private

      def translit(str)
        str.gsub!(/[^a-zA-Zа-яА-Я0-9]/, '')
        str.gsub!(/[ЬьъЪ]/, '')
        Translit.convert(str, :english)
      end

    end
  end
end
