@ArchivesWidget = React.createClass
  getInitialState: ->
    archives: []
  componentDidMount: ->
    that = @
    $.ajax({
      url: @props.url
      type: 'GET'
      cache: true
      dataType: 'json'
      success: (data) ->
        archives = []
        $.each data, (i, el) ->
          archives.push { date: i, posts: el.length }
        that.setState archives: archives
    })
  render: ->
    React.DOM.div
      className: 'col-sm-6 col-md-12 col-lg-12'
      React.DOM.div
        className: 'panel panel-default theme-panel'
        React.DOM.div
          className: 'panel-heading',
          'Archives'
        React.DOM.div
          className: 'panel-body nopadding'
          React.DOM.div
            className: 'list-group',
            for archive in @state.archives
              React.createElement Archive, key: archive.date, archive: archive