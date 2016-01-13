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

@Role = React.createClass
  render: ->
    React.DOM.span null,
      React.DOM.i null, @props.role.name

@RoleSelect = React.createClass
  render: ->
    for r in @props.roles
      options.push "<option value=#{r.id}>#{r.name}</option>"
    React.createElement 'select', null, options
