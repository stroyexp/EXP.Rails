((window, document, screen, ProJ) ->
  'use strict'


  html = document.documentElement


  ProJ.viewport =

    orientation: ->
      value: window.orientation
      if not value
        if html.clientWidth > html.clientHeight
          value = 'landscape'
        else
          value = 'portrait'
      else if value is 0 or value is 180
        value = 'portrait'
      else
        value = 'landscape'
      value

    width: ->
      value = screen.width
      if 'portrait' is @orientation()
        if screen.width > screen.height
          value = screen.height
      else
        if screen.width < screen.height
          value = screen.height
      value

    height: ->
      value = screen.height
      if 'portrait' is @orientation()
        if screen.width > screen.height
          value = screen.width
      else
        if screen.width < screen.height
          value = screen.width
      value

    scale: -> @width() / window.innerWidth

# ----------------------------------------------------------------------------------------------------

) window, document, screen, ProJ
