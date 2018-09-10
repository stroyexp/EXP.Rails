((window, document, ProJ) ->
  'use strict'


  ProJ.extend

    data: (el, property, value) ->
      if value?
        el.dataset[property] = value
        @
      else
        if property?
          el.dataset[property]
        else
          el.dataset

    style: (el, property, value) ->
      if value?
        el.style[property] = value
        @
      else
        if el.ownerDocument.defaultView.opener
          style = el.ownerDocument.defaultView.getComputedStyle el, null
        else
          style = window.getComputedStyle el, null
        if property?
          style[property]
        else
          style

    htmlClear: (code) ->
      String(code)
      .replace /<br\s?\/?>/g, '\n'
      .replace /<\/?\w+\s*\/?>/g, ''
      .replace /&nbsp/g, ' '
      .replace /&.+/g, ''

    htmlEscape: (code) ->
      String(code)
      .replace /&/g, '&amp'
      .replace /'/g, '&quot'
      .replace /'/g, '&#39'
      .replace /</g, '&lt'
      .replace />/g, '&gt'

    append: (target, param) ->
      if target?
        if not param?
          param = target
          target = document.body
        if param.length?
          for i in [0...param.length]
            @append param[i]
        else
          target.appendChild param
      @

    insert: (target, param) ->
      if target? and param?
       if param.length?
          for i in [0...param.length]
            @insert param[i]
        else
          target.parentNode.insertBefore param, target
      @

    remove: (param) ->
      if param?
        if param.length?
          for i in [0...param.length]
            @remove param[i]
        else
          param.parentNode.removeChild param
      @

    empty: (param) ->
      if param?
        if param.length?
          for i in [0...param.length]
            @empty param[i]
        else
          param.removeChild param.firstChild while param.firstChild
      @


    serialize: (target) ->
      fn = (el) ->
        disabled = el.getAttribute 'disabled'
        checkable = el.checked or not /^(?:checkbox|radio)$/i.test el.type
        submiter = /^(?:submit|button|image|reset|file)$/i.test el.type
        if el.value? and not disabled and checkable and not submiter
          name: el.name
          value: el.value.replace /\r?\n/g, "\r\n"
      (fn for el in ProJ(target).find('[name]').target)


  ProJ::extend

    data: (property, value) ->
      if value?
        @each -> @dataset[property] = value
      else
        if @length > 0
          @get().dataset[property]
        else null

    style: (property, value) ->
      if value?
        @each -> @.style[property] = value
      else
        if @length > 0
          ProJ.style @get(), property
        else null

    append: (param) ->
      ProJ.append @get(), param if @length > 0
      @

    insert: (param) ->
      ProJ.insert @get(), param if @length > 0
      @

    remove: (param) ->
      if param?
        param = @get param if typeof param is 'number' and param < @length
      else
        param = @
      ProJ.remove param

    empty: (param) ->
      if param?
        param = @get param if typeof param is 'number' and param < @length
      else
        param = @
      ProJ.empty param

    classList: (method, names) ->
      if typeof names is 'string'
        names = names.split ' '
      if method is 'contains'
        contains = yes
        @each ->
          for name in names
            contains = contains and @classList.contains name
            break if not contains
          contains
        contains
      else
        @each ->
          for name in names
            @classList[method] name
        @

    classContains: (names) ->
      @classList 'contains', names

    classAdd: (names) ->
      @classList 'add', names

    classRemove: (names) ->
      @classList 'remove', names

    classToggle: (names) ->
      @classList 'toggle', names

    serialize: ->
      if @length > 0 then ProJ.serialize @get 0

# ----------------------------------------------------------------------------------------------------

) window, document, ProJ
