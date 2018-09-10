((window, document) ->
  'use strict'


  init = (selector, context) -> new JPro selector, context


  class ProJ

    @version: '1.2.1'

    @debug: yes

    @console: (type, message) ->
      if @debug
        if not message?
          message = type
          type = 'log'
        console[type] message
      @

    @message: (message) ->
      @console message

    @error: (message) ->
      @console 'error', message

    @target: [document]

    @find: (selector, context) ->
      if typeof context is 'string'
        context = @find context
      else if context instanceof Node or context instanceof Window
        context = [context]
      else if context instanceof ProJ
        context = context.target
      context ?= @target
      switch
        when selector instanceof Node or selector instanceof Window
          [selector]
        when selector instanceof NodeList
          [].slice.call selector
        when selector instanceof ProJ
          selector.target
        when typeof selector is 'string'
          arr = []
          for item in context
            list = [].slice.call item.querySelectorAll selector
            for el in list
              arr.push el if not (el in arr)
          arr
        else
          []

    @each: (param, callback, args) ->
      if args?
        if param.length?
          for i in [0...param.length]
            break if callback.apply(param[i], args) is no
        else
          for item of param
            break if callback.apply(item, args) is no
      else
        if param.length?
          for i in [0...param.length]
            break if callback.call(param[i], i, param[i]) is no
        else
          for key, value of param
            break if callback.call(value, key, value) is no
      param

    @extend = (param, args...) ->
      if args.length is 0
        args = [param]
        param = @
      for arg in args
        for own key, value of arg
          if param[key]? and typeof param[key] is 'object' and typeof value is 'object'
            @extend param[key], value
          else
            param[key] = value
      param

    constructor: init

    find: (selector) ->
      @selector = selector if selector?
      @context = @target
      @target = ProJ.find @selector, @context
      for i in [0...@length]
        delete @[i]
      for value, key in @target
        @[key] = value
      @length = @target.length
      @

    get: (idx = 0) ->
      @target[idx] if 0 <= idx < @length

    each: (callback, args) ->
      ProJ.each @, callback, args

    extend: (param) ->
      ProJ.extend @, param


  class JPro extends ProJ

    constructor: (selector, context) ->
      @target = if context? then ProJ.find(context) else ProJ.target
      @find selector


  window.ProJ =  ProJ

# ----------------------------------------------------------------------------------------------------

)(window, document)
