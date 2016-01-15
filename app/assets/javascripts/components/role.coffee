@Role = React.createClass
  render: ->
    React.DOM.span null,
      React.DOM.i null, @props.role.name