((window, document, ProJ) ->
  'use strict'


  ProJ.extend

    assets: ''

    asset: (path)->
      path = path.slice(1) if path[0] is '/'
      if not @debug
        path = path.split '.'
        path.splice path.length - 1, 0, 'min'
        path = path.join '.'
      "#{ @assets }/#{ path }"

    link: (path, options, callback)->
      path = @asset path if path.indexOf('//') is -1
      if typeof options is 'function'
        callback = options
        options = null
      el = document.createElement 'link'
      options = ProJ.extend
        href: path
        rel: 'stylesheet'
      , options
      el.setAttribute key, value for key, value of options
      el.addEventListener 'load', callback if typeof callback is 'function'
      fn = -> document.head.appendChild el
      if window.opera is '[object Opera]'
        ProJ.onready fn
      else
        fn()

    script: (path, options, callback)->
      path = @asset path if path.indexOf('//') is -1
      if typeof options is 'function'
        callback = options
        options = null
      el = document.createElement 'script'
      options = ProJ.extend
        src: path
        async: yes
      , options
      delete options.async if not options.async
      el.setAttribute key, value for key, value of options
      el.addEventListener 'load', callback if typeof callback is 'function'
      fn = -> document.body.appendChild el
      if window.opera is '[object Opera]'
        ProJ.onready fn
      else
        fn()

# ----------------------------------------------------------------------------------------------------

) window, document, ProJ

