module ApplicationHelper
  def markdown(markdown_text)
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, {
        # no_intra_emphasis: true,
        # fenced_code_blocks: true,
        # disable_indented_code_blocks: true
      }
    )
    @markdown.render(markdown_text).html_safe
  end
end
