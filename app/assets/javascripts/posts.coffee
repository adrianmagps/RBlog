$( ->
  $.getJSON(
    '/admin/categories.json',
    (data) ->
      $.each data, (i, el) ->
        $('#categories-list').append("<a class=\"list-group-item\" href=\"/posts/category/#{el.id}\">#{el.name}</a>")
  )

  $.getJSON(
    '/tags/index.json',
    (data) ->
      c = ""
      t = ""
      $.each data, (i, el) ->
        t = JSON.parse i
        c = if el >= 2 then "big" else if el == 1 then "" else "small"
        $('#tags-list').append("<li class=\"#{c}\"><a href=\"/posts/tag/#{t[0]}\">#{t[1]}</a></li>")
  )

  $.getJSON(
    '/posts/archives.json',
    (data) ->
      $.each data, (i, el) ->
        #$('#categories-list').append("<a class=\"list-group-item\" href=\"/posts/category/#{el.id}\">#{el.name}</a>")
        console.log el
        console.log i
  )
)



#    $.getJSON('/tags/index.json', null, function (data) {
#        var c;
#        var t;
#        $.each(data, function (i, el) {
#            t = JSON.parse(i);
#            c = el >= 2 ? "big" : (el == 1 ? "" : "small");
#            $('#tags-list').append('<li class="'+c+'"><a href="/posts/tag/'+ t[0] +'">'+ t[1] +'</a></li>');
#        });
#    });
