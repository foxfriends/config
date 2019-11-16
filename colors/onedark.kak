evaluate-commands %sh{
    background='rgb:282c34'
    background_hl='rgb:3e4451'
    gutter='rgb:293133'
    comment='rgb:545862'
    text='rgb:abb2bf'
    field='rgb:e06c75'
    constant='rgb:d19a66'
    type='rgb:e5c07b'
    string='rgb:98c379'
    builtin='rgb:56b6c2'
    function='rgb:61afef'
    keyword='rgb:c678dd'

    ## code
    echo "
        face global value ${constant}
        face global type ${type}
        face global identifier ${field}
        face global field ${field}
        face global string ${string}
        face global keyword ${keyword}
        face global operator ${keyword}
        face global attribute ${keyword}
        face global comment ${comment}+i
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

    ## builtin
    echo "
        face global Default ${text},${background}
        face global PrimarySelection ${text},${background_hl}
        face global SecondarySelection ${text},${gutter}+i
        face global PrimaryCursor ${background},${text}
        face global SecondaryCursor ${text},${background_hl}
        face global LineNumbers ${background_hl},${background}
        face global LineNumberCursor ${type},${background}
        face global MenuForeground ${background},${function}
        face global MenuBackground ${background},${builtin}
        face global MenuInfo ${background_hl}
        face global Information ${background},${type}
        face global Error ${background},${field}
        face global StatusLine ${text},${background_hl}
        face global StatusLineMode ${string}
        face global StatusLineInfo ${function}
        face global StatusLineValue ${builtin}
        face global StatusCursor ${background},${text}
        face global Prompt ${function}
        face global MatchingChar ${text},${background_hl}
        face global BufferPadding ${background_hl},${background}
        face global Whitespace ${background_hl}+F
    "

    ## LSP
    echo "
        face global DiagnosticError ${field}
        face global DiagnosticWarning ${type}
    "
}
