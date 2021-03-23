#                               Windowing
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
# Attempt to detect the windowing environment(s) we"re operating under
#
# We try to load windowing environments from the `windowing_environments`
# option. For each environment in the list, the following modules are
# expected to be provided:
# *   windowing-{}-init
# *   windowing-{}-bind
#
# These modules should both begin by attempting to detect whether it"s relevant
# windowing environment is actually  in use. If not, `fail` should be run to
# prevent the rest of the module from loading. An example of such a test is
# as follows:
#
# ```
# evaluate-commands %sh{
#     [ -n "$TMUX" ] || echo "fail tmux not detected"
# }
# ```
#
# windowing-{}-init
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
# The `*-init` module should set up commands and options related to interacting
# with the windowing environment. All `*-init` modules will be loaded, so these
# modules should not bind any shared aliases.
#
# windowing-{}-bind
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
# The `*-bind` module should bind the windowing environment as the "primary"
# windowing environment, setting the common aliases. These modules are loaded
# following the order defined in the `windowing_environments` str-list, and
# once one of them completes successfully (presumably because its environment
# was detected), no others will be run.
#
# Each module is expected to bind (some of) the following aliases:
# *   terminal          - create a new terminal with sensible defaults
# *   terminal-tab      - create a new terminal in a tab
# *   terminal-left     - create a new terminal to the left
# *   terminal-right    - create a new terminal to the right
# *   terminal-above    - create a new terminal above
# *   terminal-below    - create a new terminal belo
# *   focus             - focus the specified (defaulting to current) client
#
# Options
# ‾‾‾‾‾‾‾
# termcmd
# windowing_environments
#
# User modes
# ‾‾‾‾‾‾‾‾‾‾
# windowing

declare-option -docstring \
"Command to open a new terminal. Should accept another command to be run in
that terminal as a parameter" \
str termcmd

declare-option -docstring \
"Ordered list of windowing modules to try and load. An empty list disables
both automatic module loading and environment detection, enabling complete
manual control of the module loading." \
str-list windowing_environments "tmux" "sway" "kitty"

hook -group windowing global KakBegin .* %{
    # Load all windowing environment base modules
    echo -debug "beginning windowing environment detection"
    evaluate-commands %sh{
        set -- ${kak_opt_windowing_environments}
        while [ $# -gt 0 ]; do
            echo "try %{"
            echo "  require-module windowing-${1}-init"
            echo "  echo -debug windowing-${1}-init loaded"
            echo "} catch %{ echo -debug %val{error} }"
            shift
        done
    }

    # Then go again, loading just the first that hooks up windowing aliases.
    evaluate-commands %sh{
        set -- ${kak_opt_windowing_environments}
        if [ $# -gt 0 ]; then
            echo "try %{"
            while [ $# -gt 0 ]; do
                echo "  require-module windowing-${1}-bind"
                echo "  echo -debug windowing-${1}-bind loaded"
                echo "} catch %{ "
                shift
            done
            echo "  echo -debug windowing: no module bound. Last error: %val{error}"
            echo "}"
        fi
    }
}

declare-user-mode windowing
map global windowing n ": terminal %sh{which kak} -c %val{session} <ret>" -docstring "new window"
map global windowing t ": terminal-tab %sh{which kak} -c %val{session} <ret>" -docstring "new tab"
map global windowing h ": terminal-left %sh{which kak} -c %val{session} <ret>" -docstring "split left"
map global windowing l ": terminal-right %sh{which kak} -c %val{session} <ret>" -docstring "split right"
map global windowing k ": terminal-above %sh{which kak} -c %val{session} <ret>" -docstring "split above"
map global windowing j ": terminal-below %sh{which kak} -c %val{session} <ret>" -docstring "split below"
