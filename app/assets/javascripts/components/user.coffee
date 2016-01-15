@User = React.createClass
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.user.id
      React.DOM.td null, @props.user.name
      React.DOM.td null, @props.user.email
      React.DOM.td null,
        for r in @props.role
          if r.id == @props.user.role_id
            React.createElement Role, key: r.id, role: r