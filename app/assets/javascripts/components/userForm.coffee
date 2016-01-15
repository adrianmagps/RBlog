@UserForm = React.createClass
  getInitialState: ->
    email: ''
    name: ''
    password: ''
    password_confirmation: ''
    roles: @props.roles
    url: @props.url
    token: @props.token
    errors: {}
  handleChange: (e) ->
    name = e.target.id
    @setState "#{ name }": e.target.value
  handleSubmit: (e) ->
    e.preventDefault()
    that = @
    $.ajax({
      url: @state.url
      type: 'POST'
      dataType: 'json'
      data: $(@refs.new_user).serialize()
      success: (data) ->
        that.setState that.getInitialState()
        that.handleNewUser data
      error: (error) ->
        that.setState errors: error.responseJSON
    })
  valid: ->
    @state.email && @state.password && @state.name && (@state.password == @state.password_confirmation)
  render: ->
    React.DOM.h3
      className: 'section-title',
      'Create User'
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      id: 'new_user'
      ref: 'new_user'
      action: @state.url
      React.DOM.div
        className: 'error_explanation',
        React.DOM.ul null,
          for name in Object.keys(@state.errors)
            React.DOM.li
              key: name
              className: 'text-danger',
              "#{name}: #{@state.errors[name]}"
      React.DOM.input
        type: 'hidden'
        name: @state.token.name
        value: @state.token.value
      React.DOM.div
        className: 'form-group'
        React.DOM.label
          className: 'sr-only'
          forName: 'name',
          'Name'
        React.DOM.input
          className: 'form-control'
          type: 'text'
          name: 'user[name]'
          id: 'name'
          placeholder: 'Name'
          value: @state.name
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.label
          className: 'sr-only'
          forName: 'email',
          'Email'
        React.DOM.input
          className: 'form-control'
          type: 'email'
          name: 'user[email]'
          id: 'email'
          placeholder: 'Email'
          value: @state.email
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.label
          className: 'sr-only'
          forName: 'password',
          'Password'
        React.DOM.input
          className: 'form-control'
          type: 'password'
          name: 'user[password]'
          id: 'password'
          placeholder: 'Password'
          value: @state.password
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.label
          className: 'sr-only'
          forName: 'password_confirmation',
          'Confirm Password'
        React.DOM.input
          className: 'form-control'
          type: 'password'
          name: 'user[password_confirmation]'
          id: 'password_confirmation'
          placeholder: 'Confirm Password'
          value: @state.password_confirmation
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.label
          className: 'sr-only'
          forName: 'role_id',
          'Role'
        React.DOM.select
          className: 'form-control'
          name: 'user[role_id]'
          id: 'role_id',
          for r in @state.roles
            React.createElement 'option', { key: r.id, value: r.id }, r.name
      React.DOM.button
        type: 'submit'
        className: 'btn btn-lg btn-primary'
        disabled: !@valid()
        'Create User'