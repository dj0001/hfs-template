[special:begin]
{.set|lang|en.} {.comment| edit here .}
{.set|defaulttpl|1.} {.comment| {set|defaulttpl|{match |def*| %template%} } .}
{.load|https://raw.githubusercontent.com/dj0001/hfs-template/master/addons/languages/{.if|{.^defaulttpl.}|default/.}{.or|{.?lang.}|{.^lang.}|%lang%.}.txt|special:strings.}
