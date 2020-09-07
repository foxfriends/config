# https://github.com/inkle/ink
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

# Detection
# ‾‾‾‾‾‾‾‾‾

hook global BufCreate .*[.](ink) %{
    set-option buffer filetype ink
}

# Initialization
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾

hook global WinSetOption filetype=ink %{
    require-module ink

    hook window InsertChar \n -group ink-indent ink-indent-on-new-line
    hook -once -always window WinSetOption filetype=.* %{ remove-hooks window ink-.+ }
}

hook -group markdown-highlight global WinSetOption filetype=ink %{
    add-highlighter window/ink ref ink
    hook -once -always window WinSetOption filetype=.* %{ remove-highlighter window/ink }
}


provide-module ink %§

# Highlighters
# ‾‾‾‾‾‾‾‾‾‾‾‾

add-highlighter shared/ink regions
add-highlighter shared/ink/comment     region /[*]       [*]/ ref comment
add-highlighter shared/ink/linecomment region //     $        ref comment
add-highlighter shared/ink/block       region -recurse [{] [{]       [}]|$ fill text # TODO: highlighting this is hard!
add-highlighter shared/ink/script      default-region group

add-highlighter shared/ink/script/knot          regex ^(==+)\h+([a-zA-Z_]+)(\h+=+)?         1:keyword 2:type 3:keyword
add-highlighter shared/ink/script/stitch        regex ^(=)\h+([a-zA-Z_]+)(\h+=+)?           1:keyword 2:variable 3:keyword
add-highlighter shared/ink/script/choice        regex ^((\h*[*+])+)(\h+\(([a-zA-Z_]+)\))?   1:keyword 3:keyword 4:variable
add-highlighter shared/ink/script/choicetext    regex ([^\n\[)]*)(\[([^\]]*)\]) 1:string 2:keyword 3:string
add-highlighter shared/ink/script/gather        regex ^((\h*[-])+)(\h+\(([a-zA-Z_]+)\))?    1:keyword 3:keyword 4:variable
add-highlighter shared/ink/script/tag           regex (?S)[#].+$                     0:meta
add-highlighter shared/ink/script/divert        regex (->)(\h+([a-zA-Z_]+)?(\.([a-zA-Z_]+))?(\.([a-zA-Z_]+))?)?              1:keyword 3:type 5:variable 7:variable
add-highlighter shared/ink/script/end           regex ->\s+END       0:keyword
add-highlighter shared/ink/script/glue          regex <>             0:keyword
add-highlighter shared/ink/script/include       regex ^(INCLUDE)\h+([^\n]*)$ 1:keyword 2:string

add-highlighter shared/ink/block/code default-region group
add-highlighter shared/ink/block/code/ regex [{][&!~]?             0:keyword
add-highlighter shared/ink/block/code/ regex [}]                   0:keyword
add-highlighter shared/ink/block/code/ regex \b([a-zA-Z_]+)\b      1:variable
add-highlighter shared/ink/block/code/ regex \b([a-zA-Z_]+)(?=[(]) 1:function
add-highlighter shared/ink/block/code/ regex \b(not|and|or)\b      1:keyword
add-highlighter shared/ink/block/code/ regex (&&|\|\||!)           1:keyword
add-highlighter shared/ink/block/code/ regex \b(\d+)\b             1:value
add-highlighter shared/ink/block/code/ regex \b(true|false)\b      1:value
 
# Commands
# ‾‾‾‾‾‾‾‾

define-command -hidden ink-indent-on-new-line %{
    evaluate-commands -draft -itersel %{
        # preserve previous line indent
        try %{ execute-keys -draft <semicolon> K <a-&> }
        # remove trailing white spaces
        try %{ execute-keys -draft -itersel %{ k<a-x> s \h+$ <ret> d } }
    }
}

§
