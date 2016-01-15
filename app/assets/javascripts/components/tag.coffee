@Tag = React.createClass
  render: ->
    React.DOM.li
      className: @props.tag.cn
      React.DOM.a
        href: '/posts/tag/' + @props.tag.id,
        @props.tag.name
