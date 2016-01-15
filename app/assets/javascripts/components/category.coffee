@Category = React.createClass
  render: ->
    React.DOM.a
      className: 'list-group-item'
      href: '/posts/category/' + @props.category.id,
      @props.category.name