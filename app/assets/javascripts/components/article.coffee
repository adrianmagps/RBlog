@Article = React.createClass
  render: ->
    React.DOM.div
      className: 'media'
      React.DOM.div
        className: 'media-left'
        React.DOM.a
          href: '#'
          React.DOM.img
            src: 'assets/comment-thumbnail.png'
            alt: 'author'
      React.DOM.div
        className: 'media-body'
        React.DOM.h4
          className: 'media-heading'
          React.DOM.a
            href: "posts/#{@props.article.id}",
            @props.article.title
        React.DOM.p null
