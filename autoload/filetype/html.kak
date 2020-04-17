# http://w3.org/html
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

# Detection
# ‾‾‾‾‾‾‾‾‾

hook global BufCreate .*\.(html?|svelte|vue) %{
    set-option buffer filetype html
    set buffer tabstop 2
    set buffer indentwidth 2
}

hook global BufCreate .*\.xml %{
    set-option buffer filetype xml
}

# Initialization
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾

hook global WinSetOption filetype=(html|xml) %{
    require-module html

    hook window ModeChange pop:insert:.* -group "%val{hook_param_capture_1}-trim-indent"  html-trim-indent
    hook window InsertChar '>' -group "%val{hook_param_capture_1}-indent" html-indent-on-greater-than
    hook window InsertChar \n -group "%val{hook_param_capture_1}-indent" html-indent-on-new-line

    hook -once -always window WinSetOption "filetype=.*" "
        remove-hooks window ""%val{hook_param_capture_1}-.+""
    "
}

hook -group html-highlight global WinSetOption filetype=(html|xml) %{
    add-highlighter "window/%val{hook_param_capture_1}" ref html
    hook -once -always window WinSetOption "filetype=.*" "
        remove-highlighter ""window/%val{hook_param_capture_1}""
    "
}


provide-module html %[

try %{
    require-module css
    require-module javascript
}

# Highlighters
# ‾‾‾‾‾‾‾‾‾‾‾‾

add-highlighter shared/html regions
add-highlighter shared/html/comment region <!--     -->                  fill comment
add-highlighter shared/html/tag     region <          >                  regions
add-highlighter shared/html/svelte  region '\{'     '\}'                 regions
add-highlighter shared/html/style   region <style\b.*?>\K  (?=</style>)  ref css
add-highlighter shared/html/script  region <script\b.*?>\K (?=</script>) ref javascript

add-highlighter shared/html/svelte/base default-region group
add-highlighter shared/html/svelte/base/  regex "(\{[#/](if|each|await)).*(\})"          1:keyword 3:keyword
add-highlighter shared/html/svelte/base/  regex "(\{@(html|debug)).*(\})"                1:keyword 3:keyword
add-highlighter shared/html/svelte/base/  regex "(\{:(else(\s+if)|then|catch)).*(\})"    1:keyword 3:keyword

add-highlighter shared/html/tag/base          default-region group
add-highlighter shared/html/tag/interpolation region [{]\K (?=[}])            ref javascript
add-highlighter shared/html/tag/              region '"' (?<!\\)(\\\\)*"      fill string
add-highlighter shared/html/tag/              region "'" "'"                  fill string

add-highlighter shared/html/tag/base/ regex \b([a-zA-Z0-9:_-]+)=? 1:value
add-highlighter shared/html/tag/base/ regex </?(\w+) 1:variable
add-highlighter shared/html/tag/base/ regex <(!DOCTYPE(\h+\w+)+) 1:meta

# Commands
# ‾‾‾‾‾‾‾‾

define-command -hidden html-trim-indent %{
    # remove trailing white spaces
    try %{ execute-keys -draft -itersel <a-x> s \h+$ <ret> d }
}

define-command -hidden html-indent-on-greater-than %[
    evaluate-commands -draft -itersel %[
        # align closing tag to opening when alone on a line
        try %[ execute-keys -draft <space> <a-h> s ^\h+<lt>/(\w+)<gt>$ <ret> {c<lt><c-r>1,<lt>/<c-r>1<gt> <ret> s \A|.\z <ret> 1<a-&> ]
    ]
]

define-command -hidden html-indent-on-new-line %{
    evaluate-commands -draft -itersel %{
        # preserve previous line indent
        try %{ execute-keys -draft <semicolon> K <a-&> }
        # filter previous line
        try %{ execute-keys -draft k : html-trim-indent <ret> }
        # indent after lines ending with opening tag except when it starts with a closing tag
        try %{ execute-keys -draft k <a-x> <a-k> <lt>(?!area)(?!base)(?!br)(?!col)(?!command)(?!embed)(?!hr)(?!img)(?!input)(?!keygen)(?!link)(?!menuitem)(?!meta)(?!param)(?!source)(?!track)(?!wbr)(?!/)(?!>)[a-zA-Z0-9_-]+[^>]*?>$ <ret>j<a-x><a-K>^\s*<lt>/<ret><a-gt> } }
}

]
