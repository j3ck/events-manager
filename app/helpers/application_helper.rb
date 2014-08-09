module ApplicationHelper
	def markdown(text)
	    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
	    options = {
	        autolink: true,
	        no_intra_emphasis: true,
	        fenced_code_blocks: true,
	        lax_html_blocks: true,
	        strikethrough: true,
	        superscript: true,
	        space_after_headers: true
	    }
	    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
	  end

  def tag_cloud(tags, classes)
    max = tags.sort_by(&:count).last
    tags.each do |tag|
      index = tag.count.to_f / Integer(max.count) * (classes.size - 1)
      yield(tag, classes[index.round])
    end
  end

  def current_theme
  	if signed_in?
  		current_user.profile.theme
  	else
  		"amelia"
  	end
  end
end
