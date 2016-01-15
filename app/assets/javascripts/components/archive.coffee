@Archive = React.createClass
  getInitialState: ->
    MONTH_NAMES: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  formatDate: (date) ->
    return "#{@state.MONTH_NAMES[@getMonth(date)-1]} #{@getYear(date)}"
  getDate: (val) ->
    return val.split('-')
  getYear: (date) ->
    return @getDate(date)[0]
  getMonth: (date) ->
    return parseInt(@getDate(date)[1])
  render: ->
    React.DOM.a
      className: 'list-group-item'
      href: "posts/date/#{@getYear(@props.archive.date)}/#{@getMonth(@props.archive.date)}",
      "#{@formatDate(@props.archive.date)} (#{@props.archive.posts})"
