((window, document, ProJ) ->
  'use strict'


  ProJ.extend

    on: (param, type, callback) ->
      if param.length
        for i in [0...param.length]
          @on param[i], type, callback
      else if typeof param is 'object'
        for el of param
          @on el, type, callback
      else
        param.addEventListener type, callback
      @

    off: (param, type, callback) ->
      if param.length
        for i in [0...param.length]
          @off param[i], type, callback
      else if typeof param is 'object'
        for el of param
          @off el, type, callback
      else
        param.removeEventListener type, callback
      @

    onready: (callback) ->
      document.addEventListener 'DOMContentLoaded', callback
      @

    onload: (param, callback) ->
      if typeof param is 'function'
        callback = param
        param = null
      (param ?= window).addEventListener 'load', callback
      @

    onresize: (param, callback) ->
      if typeof param is 'function'
        callback = param
        param = null
      (param ?= window).addEventListener 'resize', callback
      @

    onscroll: (param, callback) ->
      if typeof param is 'function'
        callback = param
        param = null
      (param ?= window).addEventListener 'scroll', callback
      @

    onclick: (param, callback) ->
      if typeof callback is 'string'
        url = callback
        if /\/\//.test url
          callback = -> window.open url, '_blank'
        else
          callback = -> location.assign url
      param.addEventListener 'click', callback
      @


  ProJ::extend

    on: (type, callback) -> @each -> @addEventListener type, callback

    off: (type, callback) -> @each -> @removeEventListener type, callback

    onclick: (callback) -> @each -> ProJ.onclick @, callback


  for method in [
    'onload'
    'onresize'
    'onscroll'
  ]
    do (method) -> ProJ::[method] = (callback) -> @each -> ProJ[method] @, callback

# ----------------------------------------------------------------------------------------------------

) window, document, ProJ
