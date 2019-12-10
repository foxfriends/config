# https://www.w3schools.com/sql/default.asp
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

# Detection
# ‾‾‾‾‾‾‾‾‾

hook global BufCreate .*/?(?i)sql %{
    set-option buffer filetype sql
}

# Initialization
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾

hook global WinSetOption filetype=sql %{
    require-module sql
}

hook -group sql-highlight global WinSetOption filetype=sql %{
    add-highlighter window/sql ref sql
    hook -once -always window WinSetOption filetype=.* %{ remove-highlighter window/sql }
}


provide-module sql %{

# Highlighters
# ‾‾‾‾‾‾‾‾‾‾‾‾

add-highlighter shared/sql regions
add-highlighter shared/sql/code default-region group

add-highlighter shared/sql/double_string region '"' (?<!\\)(\\\\)*" fill string
add-highlighter shared/sql/single_string region "'" (?<!\\)(\\\\)*' fill string

add-highlighter shared/sql/comment1 region '--' '$'    fill comment
add-highlighter shared/sql/comment2 region '#' '$'     fill comment
add-highlighter shared/sql/comment3 region '/\*' '\*/' fill comment

evaluate-commands %sh{
    # Keywords
    keywords="ALTER|AS|ASC|AUTO_INCREMENT|CHECK|CONSTRAINT|CREATE|DATABASE|DEFAULT|DELETE|DESC|DISTINCT|DROP"
    keywords="${keywords}|EXISTS|FOREIGN KEY|FROM|FULL JOIN|FULL OUTER JOIN|GROUP BY|HAVING|INDEX|INNER JOIN"
    keywords="${keywords}|INSERT INTO|INTO|JOIN|LEFT JOIN|LEFT OUTER JOIN|LIMIT|MODIFY|NOT NULL|ON|ORDER BY|PRIMARY KEY"
    keywords="${keywords}|REFERENCES|RIGHT JOIN|RIGHT OUTER JOIN|SELECT|SELECT TOP|SET|TABLE|TRUNCATE|UNION|UNIQUE"
    keywords="${keywords}|UPDATE|VALUES|VIEW|WHERE"
    keywords="${keywords}|COMMENT|EXTENSION|IF"

    # Operators
    operators="ALL|AND|ANY|BETWEEN|EXISTS|IN|IS|LIKE|NOT|OR|SOME"

    # MySQL data types
    data_types="LONGBLOB|LONGTEXT|MEDIUMBLOB|MEDIUMTEXT|SET|TEXT|TINYTEXT"
    data_types_fn="BIGINT|BLOB|CHAR|DATE|DATETIME|DECIMAL|DOUBLE|ENUM|FLOAT|INT"
    data_types_fn="${data_types_fn}|MEDIUMINT|SMALLINT|TIME|TIMESTAMP|TINYINT|VARCHAR|YEAR"

    # SQL Server data types
    data_types="${data_types}|bigint|bit|cursor|date|datetime|datetime2|datetimeoffset|image|int|money|nchar|ntext"
    data_types="${data_types}|nvarchar|real|smalldatetime|smallint|smallmoney|sql_variant|table|text|time"
    data_types="${data_types}|timestamp|tinyint|uniqueidentifier|varbinary|xml"
    data_types_fn="${data_types_fn}|binary|char|decimal|float|numeric|nvarchar|varbinary|varchar|varchar"

    # PostgreSQL data types
    data_types="${data_types}|UUID|TIMESTAMP(\s+WITH(OUT)?\s+TIME\s+ZONE)?"

    # MS Access data types
    data_types="${data_types}|Text|Memo|Byte|Integer|Long|Single|Double|Currency|AutoNumber|Date"
    data_types="${data_types}|Time|Ole Object|Hyperlink|Lookup Wizard"

    # Set the highlighters
    printf %s "
        add-highlighter shared/sql/code/ regex '\b([a-zA-Z0-9_]+)(?=\()'     1:function
        add-highlighter shared/sql/code/ regex '(?i)\b(${data_types_fn})\(.*?\)' 1:type
        add-highlighter shared/sql/code/ regex '(?i)\b(${data_types})\b'         1:type
        add-highlighter shared/sql/code/ regex '(?i)\b(${keywords})\b'           1:keyword
        add-highlighter shared/sql/code/ regex '(?i)\b(${operators})\b'          1:operator
    "
}

add-highlighter shared/sql/code/ regex '\+|-|\*|/|%|&|\||^|=|>|<|>=|<=|<>|\+=|-=|\*=|/=|%=|&=|^-=|\|\*=' 0:operator
add-highlighter shared/sql/code/ regex \bNULL\b          0:value
add-highlighter shared/sql/code/ regex \b\d+(?:\.\d+)?\b 0:value

}
