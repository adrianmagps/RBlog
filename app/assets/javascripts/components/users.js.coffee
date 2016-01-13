@Users = React.createClass
  getInitialState: ->
    users: @props.data
    roles: @props.roles
  getDefaultProps: ->
    users: []
    roles: []
  render: ->
    React.DOM.div null
      React.createElement UserForm, handleNewRecord: @addRecord
      React.DOM.hr null
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Id'
            React.DOM.th null, 'Name'
            React.DOM.th null, 'Email'
            React.DOM.th null, 'Roles'
        React.DOM.tbody null,
          for user in @state.users
            React.createElement User, key: user.id, user: user, role: @state.roles

@UserForm = React.createClass
  getInitialState: ->
    email: ''
    name: ''
    password: ''
    password_confirmation: ''
    roles: @props.roles
  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', { record: @state }, (data) =>
      @props.handleNewRecord data
      @setState @getInitialState(),
    'JSON'
  valid: ->
    @state.email && @state.password && @state.name && (@state.password == @state.password_confirmation)
  render: ->
    React.DOM.h3
      className: 'section-title',
      'Create User'
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          className: 'form-control'
          type: 'text'
          name: 'name'
          placeholder: 'Name'
          value: @props.name
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          className: 'form-control'
          type: 'email'
          name: 'email'
          placeholder: 'Email'
          value: @props.email
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          className: 'form-control'
          type: 'password'
          name: 'password'
          placeholder: 'Password'
          value: @props.password
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          className: 'form-control'
          type: 'password'
          name: 'password_confirmation'
          placeholder: 'Confirm Password'
          value: @props.password_confirmation
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.select
          className: 'form-control'
          name: 'role_id',
          for r in @state.roles
            React.createElement 'option', key: r.id, value: r.id, r.name
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Create User'

