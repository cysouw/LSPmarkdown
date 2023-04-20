--[[

Change crossref IDs to real numbers as used in final output

Copyright © 2021 Michael Cysouw <cysouw@mac.com>

Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
]]

local secPrefix = "sec"
local tblPrefix = "tbl"
local figPrefix = "fig"
local eqPrefix = "eq"

function changeHeaderID (head)
  if head.attributes.label ~= nil then
    head.identifier = secPrefix..tostring(head.attributes.label)
  end
  return head
end

function changeTabID (div)
  if div.content[1].tag == "Table" and div.attributes.label ~= nil then
    div.identifier = tblPrefix..tostring(div.attributes.label)
  end
  return div
end

function changeFigID (image)
  if image.attributes.label ~= nil then
    image.identifier = figPrefix..tostring(image.attributes.label)
  end
  return image
end

function changeEqID (span)
  if span.content[1].tag == "Math" and span.attributes.label ~= nil then
    span.identifier = eqPrefix..tostring(span.attributes.label)
  end
  return span
end

function changeLinks (link)
  if string.sub(link.target,1,5) == "#sec:" then
    link.target = "#"..secPrefix..pandoc.utils.stringify(link.content)
  elseif string.sub(link.target,1,5) == "#tbl:" then
    link.target = "#"..tblPrefix..pandoc.utils.stringify(link.content)
  elseif string.sub(link.target,1,5) == "#fig:" then
    link.target = "#"..figPrefix..pandoc.utils.stringify(link.content)
  elseif string.sub(link.target,1,4) == "#eq:" then
    link.target = "#"..eqPrefix..pandoc.utils.stringify(link.content)
  end
  return link
end

--------------------
-- basic Pandoc loop
--------------------

return {
  { Header = changeHeaderID },
  { Div = changeTabID },
  { Image = changeFigID },
  { Span = changeEqID },
  { Link = changeLinks }
}
