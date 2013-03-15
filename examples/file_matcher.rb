class FileMatcher
  def initialize(source)
    @source = source
  end

  def filesEnding(query, &block)
    matcher = ->(query, file) { file.end_with?(query) }
    filesMatching(matcher, &block)
  end

  def filesContaining(query, &block)
    match = ->(query, file) { file.include?(query) }
    filesMatching( matcher, &block)
  end

  def filesMatching(query, matcher, &block)
    files.select do |file|
      block.call(file) if matcher.call(query, file)
    end
  end

  def files
    @files ||= Dir.foreach(@source)
  end
end

class FileMatcherWithClosures

  def initialize(source)
    @source = source
  end

  def filesEnding(query, &block)
    filesMatching(->(file) { file.end_with?(query) }, &block)
  end

  def filesContaining(query, &block)
    filesMatching(->(file) { file.include?(query) }, &block)
  end

  def filesRegex(query, &block)
    filesMatching(->(file) { file.match(query) }, &block)
  end

  def filesMatching(matcher, &block)
    files.map do |file|
      block.call(file) if matcher.call(file)
    end.compact
  end

  def files
    @files ||= Dir.foreach(@source)
  end
end

if __FILE__ == $0
  matcher = FileMatcherWithClosures.new(".")

  matcher.filesEnding("rb") do |file|
    puts file
  end

  match.filesRegex(/^\d*.rb$/) do |file|
    delete_file file
  end
end
