define-command -docstring "open ranger to pick a file" ranger %{ evaluate-commands %sh{
    ranger_tmp=$(mktemp -d ${TMPDIR:-/tmp}/ranger.kak.XXXXXX)
    rangercmd="${ranger_tmp}/rangercmd"
    result="${ranger_tmp}/result"

    (
        shell_path="$(command -v sh)"
        if [ -n "${shell_path}" ]; then
            # portable shebang
            printf "%s\n" "#!${shell_path}"
        fi
        start=$(dirname ${kak_buffile})
        printf "%s\n" "cd \"${PWD}\" && ranger --choosefile=${result} ${start}"
        printf "%s\n" "rm ${rangercmd}"
    ) >> ${rangercmd}
    chmod 755 ${rangercmd}

    cmd="terminal-tab ${rangercmd}"
    printf "%s\n" "${cmd}"

    # main loop
    (   while [ -e ${rangercmd} ]; do sleep 0.1; done
        if [ -s ${result} ]; then
            (
                file="$(cat $result)"
                if [ -n "${file}" ]; then
                    item=$(printf "%s" "${file}" | sed "s/@/@@/g;s/&/&&/g")
                    printf "%s\n" "evaluate-commands -client ${kak_client} %&edit -existing %@${item}@&"
                fi
            ) < ${result} | kak -p ${kak_session}
        fi
        rm -rf ${ranger_tmp}
    ) > /dev/null 2>&1 < /dev/null &
}}
