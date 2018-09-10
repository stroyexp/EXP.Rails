((window, document, documentElement, ProJ) ->
  'use strict'


  ProJ.extend

    scrollTo: (x, y, options, callback) ->
      if typeof options is 'function'
        callback = options
        options = null
      options = ProJ.extend
        duration: ProJ.animation.duration
      , options
      steps = options.duration / ProJ.animation.delay
      stepX = ((window.pageXOffset or documentElement.scrollLeft) - x) / steps
      stepY = ((window.pageYOffset or documentElement.scrollTop) - y) / steps
      render = ->
        window.scrollBy -stepX, -stepY
        if --steps
          ProJ.animation.request render, window
        else
          window.scrollTo x, y
          callback.call window if typeof callback is 'function'
      if stepX or stepY
        steps = Math.round steps
        render()
      @

    totop: (options, callback) ->
      options = duration: options if typeof options is 'number'
      @scrollTo 0, 0, options, callback

    toobj: (target, options, callback) ->
      options = margin: options if typeof options is 'number'
      options = ProJ.extend
        margin: 0
      , options
      target = ProJ.to target
      @scrollTo 0, target.offset().top - options.margin, options, callback if target.length

    animate: (el, options, callback) ->
      el = document.querySelector el if typeof el is 'string'
      property = Object.keys(options)[0]
      to = options[property]
      from = options.from ?= parseInt ProJ(el).style(property), 10
      el.style[property] = from
      steps = (options.duration ?= @animation.duration) / @animation.delay
      step = (from - to) / steps
      render = ->
        from -= step
        el.style[property] = from
        if --steps
          el.dataset.animate = ProJ.animation.request render, el
        else
          el.style[property] = to
          delete el.dataset.animate
          callback.call el if typeof callback is 'function'
      if step
        steps = Math.round steps
        render()
      @

    queue: (el, callback) ->
      el = document.querySelector el if typeof el is 'string'
      fn = ->
        if el.dataset.animate?
          setTimeout fn, 1000 / ProJ.animation.delay
        else
          callback()
      fn()
      @

    stop: (el) ->
      el = document.querySelector el if typeof el is 'string'
      if el.dataset.animate?
        ProJ.animation.cancel el.dataset.animate
        delete el.dataset.animate
      @

    hide: (el, duration, callback) ->
      el = document.querySelector el if typeof el is 'string'
      if typeof duration is 'function'
        callback = duration
        duration = 0
      @queue el, ->
        ProJ.animate el,
          opacity: 0
          duration: duration
        , ->
          el.style.display = 'none'
          callback.call el if typeof callback is 'function'

    show: (el, duration, callback) ->
      el = document.querySelector el if typeof el is 'string'
      if typeof duration is 'function'
        callback = duration
        duration = 0
      @queue el, ->
        if el.style.display is 'none'
          el.style.display = ''
          el.style.opacity = 0
        ProJ.animate el,
          opacity: 1
          duration: duration
        , callback


  ProJ::extend

    animate: (options, callback) ->
      @each -> ProJ.animate @, options, callback

    queue: (callback) ->
      @each -> ProJ.queue @, callback

    stop: ->
      @each -> ProJ.stop @

    hide: (duration, callback) ->
      @each -> ProJ.hide @, duration, callback

    show: (duration, callback) ->
      @each -> ProJ.show @, duration, callback

    toggle: (duration, callback) ->
      @each ->
        if @style.display is 'none'
          ProJ.show @, duration, callback
        else
          ProJ.hide @, duration, callback

# ----------------------------------------------------------------------------------------------------

) window, document, document.documentElement, ProJ
