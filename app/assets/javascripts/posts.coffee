$( ->

  MONTH_NAMES = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

  formatDate = (date) ->
    d = new Date(date)
    return "#{MONTH_NAMES[d.getMonth()]} #{d.getFullYear()}"

  howManyTime = (date) ->
    return ''

  $.getJSON(
    '/admin/categories.json',
    (data) ->
      $('#categories-loading').remove()
      list = $('#categories-list')
      $.each data, (i, el) ->
        list.append("<a class=\"list-group-item\" href=\"/posts/category/#{el.id}\">#{el.name}</a>")
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
        list.append("<a href=\"#\" class=\"list-group-item\">#{formatDate(i)} (#{el})</a>")
  )

#  $.getJSON(
#    '/posts/recents.json',
#    (data) ->
#      $('#recents-loading').remove()
#      list = $('#recents-list')
#      $.each data, (i, el) ->
#        cat = if el.categories.length > 0 then el.categories[0] else { id: '0', name: 'General' }
#        template = "<div class=\"media\">
#                      <div class=\"media-left\">
#                        <a href=\"#\">
#                          <img src=\"assets/comment-thumbnail.png\" alt=\"author\"/>
#                        </a>
#                      </div>
#                      <div class=\"media-body\">
#                        <h4 class=\"media-heading\"><a href=\"#\">#{el.title}</a></h4>
#                        <p><a href=\"/posts/category/#{cat.id}\">#{cat.name}</a> &bull; #{howManyTime(el.created_at)}</p>
#                      </div>
#                    </div>"
#        list.append(template)
#  )
)
