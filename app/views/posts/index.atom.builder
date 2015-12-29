atom_feed({'xmlns:app' => 'http://www.w3.org/2007/app',
           'xmlns:openSearch' => 'http://a9.com/-/spec/opensearch/1.1/'}) do |feed|
  feed.title "RBlog 2015 Feed"
  feed.updated @posts.first.updated_at if @posts.length > 0
  feed.tag!('openSearch:totalResults', 10)

  @posts.each do |post|
    feed.entry(post) do |entry|
      entry.title post.title
      entry.content post.content, :type => 'html'
      entry.tag!('app:edited', Time.now)

      entry.author do |author|
        author.name post.user.name
        author.email post.user.email
      end
    end
  end
end