-- use strikeout markup with ~~ for smallcaps
-- add "--lua-filter=smallcaps.lua" to pandoc

-- Copyright © 2021 Michael Cysouw <cysouw@mac.com>

function make_lower (s)
  return pandoc.Str(pandoc.text.lower(s.text))
end

function turnToSmallCaps (elem)
  elem = pandoc.walk_inline(elem, { Str = make_lower } )
  return pandoc.SmallCaps(elem.content)
end

return {{
  Strikeout = turnToSmallCaps
}}