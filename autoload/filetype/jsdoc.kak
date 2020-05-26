# Detection
# ‾‾‾‾‾‾‾‾‾
# NOTE: there is no detection, as this language is included by JavaScript/TypeScript. It
# makes no sense on its own.

# Initialization
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾

hook global WinSetOption filetype=(javascript|typescript) %{
    require-module jsdoc
}

provide-module jsdoc %§

# Highlighters
# ‾‾‾‾‾‾‾‾‾‾‾‾
add-highlighter shared/jsdoc regions
add-highlighter shared/jsdoc/block          default-region group

add-highlighter shared/jsdoc/block/         fill comment
add-highlighter shared/jsdoc/block/         regex  (@abstract|@virtual)\b 1:keyword
add-highlighter shared/jsdoc/block/         regex  (@access)\b\h+(package|private|protected|public) 1:keyword 2:keyword
add-highlighter shared/jsdoc/block/         regex  (@package|@private|@protected|@public)\b 1:keyword
add-highlighter shared/jsdoc/block/         regex  (@alias)\b\h+(\S+) 1:keyword 2:variable
add-highlighter shared/jsdoc/block/         regex  (@async)\b 1:keyword
add-highlighter shared/jsdoc/block/         regex  (@author)\b\h+(.+)\h+(<(.*)>)?$ 1:keyword 2:string 4:meta
add-highlighter shared/jsdoc/block/         regex  (@borrows)\b\h+(\S+)\h+(as)\h+(\S+) 1:keyword 2:variable 3:keyword 4:variable
add-highlighter shared/jsdoc/block/         regex  (@callback)\b\h+(\S+) 1:keyword 2:type
add-highlighter shared/jsdoc/block/         regex  (@class|@constructor)\b(\h+\{([^}]+)\})?(\h+(\S+))? 1:keyword 3:type 5:type
add-highlighter shared/jsdoc/block/         regex  (@classdesc)\b 1:keyword
add-highlighter shared/jsdoc/block/         regex  (@const(ant)?)\b(\h+\{([^}]+)\})?(\h+(\S+))? 1:keyword 4:type 6:variable
add-highlighter shared/jsdoc/block/         regex  (@constructs)\b(\h+(\S+))? 1:keyword 3:type
add-highlighter shared/jsdoc/block/         regex  (@copyright)\b 1:keyword
add-highlighter shared/jsdoc/block/         regex  (@default(value)?)\b(\h+(\S+)) 1:keyword 3:value
add-highlighter shared/jsdoc/block/         regex  (@deprecated)\b 1:keyword
add-highlighter shared/jsdoc/block/         regex  (@desc(ription)?)\b 1:keyword
add-highlighter shared/jsdoc/block/         regex  (@enum)\b(\h+\{([^}]+)\})? 1:keyword 3:type

§
