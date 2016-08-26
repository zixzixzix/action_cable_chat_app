module MessagesHelper

  # Returns sanitized HTML from input text using GitHub-flavored Markdown.
  def markdown(text)
    sanitize Kramdown::Document.new(text, input: 'GFM').to_html
  end
end
