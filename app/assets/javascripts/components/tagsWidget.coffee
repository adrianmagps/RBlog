@TagsWidget = React.createClass
  getInitialState: ->
    tags: []
  componentDidMount: ->
    that = @
    $.ajax({
      url: @props.url
      type: 'GET'
      cache: true
      dataType: 'json'
      success: (data) ->
        tags = []
        $.each data, (i, el) ->
          t = JSON.parse i
          c = if el >= 2 then "big" else if el == 1 then "" else "small"
          tags.push { id: t[0], name: t[1], cn: c }
        that.setState tags: tags
    })
  render: ->
    React.DOM.div
      className: 'col-sm-6 col-md-12 col-lg-12'
      React.DOM.div
        className: 'panel panel-default theme-panel'
        React.DOM.div
          className: 'panel-heading',
          'Tags'
        React.DOM.div
          className: 'panel-body'
          React.DOM.ul
            className: 'list-inline tags',
            for tag in @state.tags
              React.createElement Tag, key: tag.id, tag: tag