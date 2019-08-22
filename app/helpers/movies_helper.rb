module MoviesHelper
  def youtube_id(youtube_url)
    regex = /(?:youtube(?:-nocookie)?\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11})/
    match = regex.match(youtube_url)
    if match && !match[1].blank?
      match[1]
    else
      nil
    end
  end
end
