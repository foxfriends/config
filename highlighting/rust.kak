# Built in Rust syntax highlighting was insufficient, so I am building my own

add-highlighter shared/rust regions
add-highlighter shared/rust/code default-region group

add-highlighter shared/rust/string           region %{(?<!')"} (?<!\\)(\\\\)*"              fill string
add-highlighter shared/rust/raw_string       region -match-capture %{(?<!')r(#*)"} %{"(#*)} fill string
add-highlighter shared/rust/comment          region -recurse "/\*" "/\*" "\*/"              fill comment
add-highlighter shared/rust/doc_comment      region "///" "$"                               fill comment
add-highlighter shared/rust/line_comment     region "//" "$"                                fill comment
add-highlighter shared/rust/attribute        region "#\[" "\]"                              fill meta

add-highlighter shared/rust/code/operator     regex (\[|\]|=|==|!=|\+=|-=|\*=|/=|%=|<|>|<=|>=|=>|->|\+|-|/|\*|%|~|\||\|\||&|&&|!|^|\?|<<|>>|<<=|>>=|:|::|\.) 1:operator

add-highlighter shared/rust/code/number       regex \b(0|([1-9][0-9_]*)(\.[0-9]*)?(e[+-]?[1-9][0-9]*)?|0x[0-9A-Fa-f]+|0b[01]+)?\b 1:value
add-highlighter shared/rust/code/character    regex ('([^'\\]|\\'|\\\\|\\u\{[0-9a-fA-F]{1,4}\})') 1:value
add-highlighter shared/rust/code/bool         regex \b(true|false)\b 1:value

add-highlighter shared/rust/code/module       regex ^\s*mod\s+((r#)?[a-zA-Z_][a-zA-Z0-9_]*) 1:module
add-highlighter shared/rust/code/namespace    regex \b((r#)?[a-z][a-zA-Z0-9_]*)(\s*)(?=::[^<]) 1:module
add-highlighter shared/rust/code/keyword      regex \b(?<!r#)(use|mod|struct|enum|async|fn|trait|impl|return|if|match|where|in|as|else|for|loop|const|static|let|mut|ref|dyn|box|pub|crate|super|extern|move)\b 1:keyword

add-highlighter shared/rust/code/type         regex \b((r#)?[A-Z][a-zA-Z0-9_]*)\b 1:type
add-highlighter shared/rust/code/constant     regex \b((r#)?[A-Z_]+)\b 1:value

add-highlighter shared/rust/code/function     regex \b((r#)?[a-z_][a-zA-Z_0-9]*)\s*(?=\() 1:function
add-highlighter shared/rust/code/turbo_fish   regex \b((r#)?[a-z_][a-zA-Z_0-9]*)(?=::<) 1:function

add-highlighter shared/rust/code/macro        regex \b((r#)?[a-z_][a-zA-Z_0-9]*!)\s*(?=[\[{(]) 1:meta
add-highlighter shared/rust/code/lifetime     regex ('[A-Za-z_][A-Za-z_0-9]*)[^'] 1:meta
add-highlighter shared/rust/code/primitive    regex \b(i8|i16|i32|i64|i128|isize|u8|u16|u32|u64|u128|usize|f32|f64|fsize|str|char|bool)\b 1:keyword
add-highlighter shared/rust/code/identifier   regex \bself\b 0:identifier
