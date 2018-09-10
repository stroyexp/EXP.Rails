((window, ProJ) ->
  'use strict'


  getRect = (el) -> el.getBoundingClientRect?() or
  top: 0
  left: 0
  bottom: 0
  right: 0

  isWindow = (el) -> el is el.window

  getWindow = (el) -> if isWindow el then el else el.defaultView


  ProJ.extend

    innerHeight: (el) ->
      if isWindow(el) then el.innerHeight else el.clientHeight

    innerWidth: (el) ->
      if isWindow el then el.innerWidth else el.clientWidth

    outerHeight: (el, includeMargin = yes) ->
      height = @innerHeight el
      if includeMargin and not isWindow el
        computedStyle = window.getComputedStyle el
        height += parseInt computedStyle.marginTop, 10
        height += parseInt computedStyle.marginBottom, 10
      height

    outerWidth: (el, includeMargin = yes) ->
      width = @innerWidth el
      if includeMargin and not isWindow el
        computedStyle = window.getComputedStyle el
        width += parseInt computedStyle.marginLeft, 10
        width += parseInt computedStyle.marginRight, 10
      width

    scrollTop: (el) ->
      win = getWindow el
      if win then win.pageYOffset else el.scrollTop

    scrollLeft: (el) ->
      win = getWindow el
      if win then win.pageXOffset else el.scrollLeft

    offset: (el) ->
      return null if not el.ownerDocument
      win = getWindow el.ownerDocument
      html = el.ownerDocument.documentElement
      rect = getRect el
      top: rect.top + win.pageYOffset - html.clientTop
      left: rect.left + win.pageXOffset - html.clientLeft

    view: (el, full = no) ->
      rect = getRect el
      port =
        bottom: window.innerHeight or html.clientHeight
        right: window.innerWidth or html.clientWidth
      if full
        rect.top >= 0 and \
          rect.left >= 0 and \
          rect.bottom <= port.bottom and \
          rect.right <= port.right
      else
        rect.top <= port.bottom and \
          rect.left <= port.right and \
          rect.bottom >= 0 and \
          rect.right >= 0


  for method in [
    'innerHeight'
    'innerWidth'
    'outerHeight'
    'outerWidth'
    'scrollTop'
    'scrollLeft'
    'offset'
    'view'
  ]
    do (method) ->
      ProJ::[method] = (param)->
        ProJ[method] @get(), param if @length > 0

# ----------------------------------------------------------------------------------------------------

) window, ProJ
