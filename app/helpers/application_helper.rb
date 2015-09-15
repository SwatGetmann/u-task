class HTMLwithPygments < Redcarpet::Render::HTML
  def block_code(code, language)
    Pygments.highlight(code, lexer: language)
  end
end

module ApplicationHelper
	def markdown(text)
		options = {
			:filter_html => true,
			:safe_links_only => true,
			:hard_wrap => true,
			:prettify => true
    }

    extensions = {
    	:no_intra_emphasis => true,
    	:tables => true,
    	:fenced_code_blocks => true,
    	:autolink => true,
    	:strikethrough => true,
    	:lax_spacing => true,
    	:space_after_headers => true,
    	:superscript => true,
    	:underline => true,
    	:highlight => true,
    	:quote => true,
    	:footnotes => true
    }

    # renderer = Redcarpet::Render::HTML::new(options)
    # markdown = Redcarpet::Markdown.new(renderer, extensions)
    renderer = HTMLwithPygments.new(options)
		markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
	end

    include ActsAsTaggableOn::TagsHelper
end