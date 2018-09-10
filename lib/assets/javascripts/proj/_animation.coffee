((window, ProJ) ->
  'use strict'


  ANIMATION_DELAY = 60
  ANIMATION_DURATION = 1000


  ProJ.animation =

    delay: ANIMATION_DELAY
    duration: ANIMATION_DURATION

    request: (callback, el) ->
      delay = @delay
      (
        window.requestAnimationFrame\
          or
          window.webkitRequestAnimationFrame\
          or
          window.mozRequestAnimationFrame\
          or
          window.oRequestAnimationFrame\
          or
          window.msRequestAnimationFrame\
          or
          (callback) ->
            setTimeout callback, delay
      ) callback, el


    cancel: (id) -> (
      window.cancelAnimationFrame\
        or
        window.webkitCancelRequestAnimationFrame\
        or
        window.mozCancelAnimationFrame\
        or
        window.oCancelRequestAnimationFrame\
        or
        window.msCancelRequestAnimationFrame\
        or
        (id) ->
          clearTimeout id
    ) id

# ----------------------------------------------------------------------------------------------------

) window, ProJ
