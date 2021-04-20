# https://github.com/foxfriends/joshuto
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
# this one requires my fork (original: https://github.com/kamiyaa/joshuto/) as
# it adds support for the --choosefile option

provide-module joshuto %{
    check-cmd joshuto
    define-command -docstring "use joshuto to find and open a file" joshuto %{
        set-register i %sh{
            if [ $(dirname "${kak_buffile}") = '.' ]; then
                pwd
            else
                dirname "${kak_buffile}"
            fi
        }
        evaluate-result "run() { ""%val{config}/scripts/joshuto"" ""$1"" --path '%reg{i}'; } && run"
    }
}
