$( ->

  MONTH_NAMES = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

  formatDate = (date) ->
    return "#{MONTH_NAMES[getMonth(date)-1]} #{getYear(date)}"

  getDate = (val) ->
    return val.split('-')

  getYear = (date) ->
    return getDate(date)[0]

  getMonth = (date) ->
    return parseInt(getDate(date)[1])

  $.getJSON(
    '/admin/categories.json',
    (data) ->
      $('#categories-loading').remove()
      list = $('#categories-list')
      $.each data, (i, el) ->
        list.append("<a id=\"category_#{el.name}_#{el.id}\" class=\"list-group-item\" href=\"/posts/category/#{el.id}\">#{el.name}</a>")
  )

  $.getJSON(
    '/tags/index.json',
    (data) ->
      $('#tags-loading').remove()
      c = ""
      t = ""
      list = $('#tags-list')
      $.each data, (i, el) ->
        t = JSON.parse i
        c = if el >= 2 then "big" else if el == 1 then "" else "small"
        list.append("<li class=\"#{c}\"><a href=\"/posts/tag/#{t[0]}\">#{t[1]}</a></li>")
  )

  $.getJSON(
    '/posts/archives.json',
    (data) ->
      $('#archives-loading').remove()
      list = $('#archives-list')
      $.each data, (i, el) ->
        list.append("<a href=\"/posts/date/#{getYear(i)}/#{getMonth(i)}\" class=\"list-group-item\">#{formatDate(i)} (#{el.length})</a>")
  )

)
