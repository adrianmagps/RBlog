@Users = React.createClass
  getInitialState: ->
    users: @props.data
    roles: @props.roles
  getDefaultProps: ->
    users: []
    roles: []
  addUser: (user) ->
    users = @state.users.slice()
    users.push user
    @setState users: users
  render: ->
    React.DOM.div
      className: 'users'
      React.DOM.h1
        className: 'page-header',
        'Users'
      React.createElement UserForm, {handleNewUser: @addUser, roles: @state.roles, token: @props.token, url: @props.url}
      React.DOM.hr null
      React.DOM.table
        className: 'table table-hover'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Id'
            React.DOM.th null, 'Name'
            React.DOM.th null, 'Email'
            React.DOM.th null, 'Roles'
        React.DOM.tbody null,
          for user in @state.users
            React.createElement User, key: user.id, user: user, role: @state.roles
