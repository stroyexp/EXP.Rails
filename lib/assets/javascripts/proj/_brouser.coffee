((window, document, navigator, location, ProJ) ->
  'use strict'


  agent = navigator.userAgent

  brouser =
    mobile: agent.match /mobile/
    ie: (agent.match /MSIE\s(\d+)\./ ) and parseInt RegExp.$1
    ieMobile: (agent.match /IEMobile\s(\d+)\./ ) and parseInt RegExp.$1
    android: agent.match /Android/
    webkit: agent.match /WebKit/
    iPad: agent.match /iPad/
    iPhone: agent.match /iPhone/
    nokia: agent.match /Nokia/

  brouser.androidMobile = brouser.android and brouser.mobile
  brouser.iOS = brouser.iPad or brouser.iPhone or brouser.iPod
  brouser.mobile = brouser.mobile or brouser.nokia or brouser.ieMobile or brouser.androidMobile or brouser.iPad or brouser.iPhone

  brouser.language = (navigator.language or navigator.browserLanguage).substr(0, 2).toLowerCase()


  ProJ.extend

    brouser: brouser

    protocol: if location.protocol is 'https:' then 'https:' else 'http:'

    touch: ('ontouchstart' in window) or (window.DocumentTouch && document instanceof DocumentTouch)

# ----------------------------------------------------------------------------------------------------

) window, document, navigator, location, ProJ
