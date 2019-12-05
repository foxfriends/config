evaluate-commands %sh{
    background='black'
    background_hl='bright-black'
    gutter='rgb:31353A'
    comment='bright-white'
    text='white'
    field='cyan'
    constant='red'
    type='yellow'
    string='green'
    builtin='bright-blue'
    function='blue'
    keyword='magenta'

    ## code
    echo "
        face global text ${text}
        face global value ${constant}
        face global type ${type}
        face global variable ${field}
        face global identifier ${field}
        face global field ${field}
        face global string ${string}
        face global keyword ${keyword}
        face global operator ${keyword}
        face global attribute ${keyword}
        face global comment ${comment}+i
        face global doc_comment ${comment}+b
        face global meta ${builtin}
        face global builtin ${builtin}
        face global function ${function}
        face global module ${field}+i
    "

    ## markup
    echo "
        face global title ${field}+b
        face global header ${field}+b
        face global bold ${type}+b
        face global italic ${keyword}+i
        face global mono ${string}
        face global block ${builtin}
        face global link ${constant}
        face global bullet ${field}
        face global list ${field}
    "

    ## custom
    echo "
        face global NormalCursor default,${background_hl}
        face global InsertCursor ${background},${text}
    "

    ## builtin
    echo "
        face global Default ${text},${background}
        face global PrimarySelection default,${gutter}
        face global SecondarySelection default,${gutter}+i
        face global PrimaryCursor NormalCursor
        face global PrimaryCursorEol ${background}+f@PrimaryCursor
        face global SecondaryCursor default,${background_hl}+i
        face global SecondaryCursorEol ${background}+f@SecondaryCursor
        face global LineNumbers ${background_hl},${background}
        face global LineNumberCursor ${type},${background}
        face global MenuForeground ${background},${type}+b
        face global MenuBackground ${background},${text}
        face global MenuInfo ${background_hl}
        face global Information ${background},${type}
        face global Error ${background},${field}
        face global StatusLine ${text},${background_hl}
        face global StatusLineMode ${string}
        face global StatusLineInfo ${function}
        face global StatusLineValue ${builtin}
        face global StatusCursor ${background},${text}
        face global Prompt ${function}
        face global MatchingChar default,${background_hl}
        face global Reference default+u
        face global BufferPadding ${background_hl},${background}
        face global Whitespace ${background_hl}+f
    "

    echo "hook global ModeChange '.*:insert' %{ face global PrimaryCursor @InsertCursor }"
    echo "hook global ModeChange '.*:normal' %{ face global PrimaryCursor @NormalCursor }"

    ## LSP
    echo "
        face global DiagnosticError default+u
        face global DiagnosticWarning default+u
    "
}
