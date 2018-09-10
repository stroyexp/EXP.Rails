((ProJ) ->
  'use strict'


  ProJ.ajax = (options) ->
    options = ProJ.extend
      type: 'GET'
      async: yes
      username: null
      password: null
      data: null
    , options
    xhr = new XMLHttpRequest()
    xhr.open options.type, options.url, options.async, options.username, options.password
    xhr.setRequestHeader 'contentType', 'application/x-www-form-urlencoded; charset=UTF-8'
    xhr.onreadystatechange = ->
      if xhr.readyState != 4 or xhr.status != 200
        options.success xhr.responseText if typeof options.success is 'function'
      else
        options.error xhr.responseText if typeof options.error is 'function'
    xhr.send options.data

# ----------------------------------------------------------------------------------------------------

) ProJ
