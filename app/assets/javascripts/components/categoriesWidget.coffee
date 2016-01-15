@CategoriesWidget = React.createClass
  getInitialState: ->
    categories: []
  componentDidMount: ->
    that = @
    $.ajax({
      url: @props.url
      type: 'GET'
      cache: true
      dataType: 'json'
      success: (data) ->
        that.setState categories: data
    })
  render: ->
    React.DOM.div
      className: 'col-sm-6 col-md-12 col-lg-12'
      React.DOM.div
        className: 'panel panel-default theme-panel'
        React.DOM.div
          className: 'panel-heading',
          'Categories'
        React.DOM.div
          className: 'panel-body nopadding'
          React.DOM.div
            className: 'list-group',
            for category in @state.categories
              React.createElement Category, key: category.id, category: category
