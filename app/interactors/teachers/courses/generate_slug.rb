module Teachers
  module Courses
    class GenerateSlug
      include Interactor

      delegate :course, to: :context

      def call
        return if course.slug.present?

        title = course.title.strip
        course.slug = translit(title).gsub(/ /, '_') + "#{Time.now.to_i}"
      end

      private

      def translit(str)
        str.gsub!(/([^a-zA-Zа-яА-Я0-9])*([ЪъЬь])*/,'')
        Translit.convert(str, :english)
      end

    end
  end
end
