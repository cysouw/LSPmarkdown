--[[
inline-footnotes is a lua filter for pandoc (pandoc.org) to 
add footnotes inline into the HTML output of pandoc

This filter is by Albert Krewinkel (tarleb) from stackoverflow: 
https://stackoverflow.com/questions/62305956/fivethirtyeight-style-in-text-footnotes-for-bookdown
with minor changes by Michael Cysouw

Copyright © 2023 Albert Krewinkel <albert@tarleb.com>, Michael Cysouw <cysouw@mac.com>

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

-- how many notes we've seen yet.
local note_number = 0

local fn_opening_template = [[
<span id="fn%d"><label for="fn%d-toggle" class="fn-number"><sup>%d</sup></label>
<input type="checkbox" hidden id="fn%d-toggle"/>
]]
local fn_close = '</span>'

local style_css = [[
<!-- CSS added by pandoc filter 'inline-footnotes.lua' -->  
<style>
input[type=checkbox][id^=fn] + span {
  display: none;
}
input[type=checkbox][id^=fn]:checked + span {
  display: block;
}
p:has(input[type=checkbox][id^=fn]:not(:checked)) {
  display: flow-root;
}
.footnote {
font-size: smaller;
padding: 20px 40px 20px 40px;
}
.fn-number{
padding-left: 2px;
font-weight: bold;
}
.fn-number:before{
  content: '▸ ';
  vertical-align: super;
  font-size: small;
}
.fn-number:has(+ input[type=checkbox][id^=fn]:checked):before{
  content: '▾ ';
  vertical-align: super;
  font-size: small;
  }
@media (max-width: 900px) {
  .fn-number:before{
    font-size: x-small;
  }
  .fn-number:has(+ input[type=checkbox][id^=fn]:checked):before{
    font-size: x-small;
  }
}
</style>
]]

-- Use custom HTML for footnotes.
function Note (note)
  note_number = note_number + 1
  local fn_open = fn_opening_template:format(
    note_number, note_number, note_number, note_number)
  return {
    pandoc.RawInline('html', fn_open),
    pandoc.Span(
      pandoc.utils.blocks_to_inlines(note.content),
      pandoc.Attr(string.format('fn%d-content', note_number), {'footnote'})
    ),
    pandoc.RawInline('html', fn_close)
  }
end

function Meta (meta)
  local header_includes = meta['header-includes']
  -- ensure that header_includes is a MetaList
  if not header_includes then
    header_includes = pandoc.MetaList{}
  elseif header_includes.t ~= 'MetaList' then
    header_includes = pandoc.MetaList {header_includes}
  end
  table.insert(
    header_includes,
    pandoc.MetaBlocks{pandoc.RawBlock('html', style_css)}
  )
  meta['header-includes'] = header_includes
  return meta
end
