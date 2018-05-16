module ApplicationHelper
  def markdown(text)
    options = {
      filter_html:     true,
      hard_wrap:       true,
      link_attributes: {rel: 'nofollow', target: "_blank"}
    }

    extensions = {
      autolink:                     true,
      superscript:                  true,
      lax_spacing:                  true,
      space_after_headers:          true,
      disable_indented_code_blocks: true,
      fenced_code_blocks:           true,
      tables:                       true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end
end
