((ProJ) ->
  'use strict'


  ProJ.extend

    to: (data) ->
      if data and not (data instanceof ProJ)
        ProJ data
      else data

    fromJSON: (data) ->
      JSON.parse data if typeof data is 'string' and data.match /\[(.+)\]/

    toJSON: (data) ->
      JSON.stringify data

    count: (data) ->
      if target.length? then target.length else [].slice.call(target).length

    omit: (obj, arg) ->
      hold = []
      @each obj, (idx) ->
        if typeof arg is 'function'
          res = arg.call @
        else if typeof arg is 'object'
          for item in arg
            res = @ is item
            break if res
        else
          res = @ is arg
        hold.push idx if res
      @each hold, ->
        delete obj[@]
      obj

    hexRgb: (hex) ->
      if hex.length is 4
        hex = hex.replace /^#?([a-f\d])([a-f\d])([a-f\d])$/i,
          (match, r, g, b) -> "#{ r }#{ r }#{ g }#{ g }#{ b }#{ b }"
      rgb = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec hex
      if rgb
        r: parseInt rgb[1], 16
        g: parseInt rgb[2], 16
        b: parseInt rgb[3], 16
      else null

      dump: (variable, level = 0) ->
        fn = (data, deep = 0) ->
          output = ''
          if typeof data is 'object' and (not level or deep < level)
            for key, value of data
              output += Array(deep).join("\t") + key + ' : ' + fn(value, ++deep) + "\n"
          else
            output = data + "\n"
          output
        console.log fn variable

# ----------------------------------------------------------------------------------------------------

) ProJ
