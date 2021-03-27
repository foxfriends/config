# Tool: fuzzyfinder
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
# fuzzyfinder finds files by fuzzy matching. Sometimes it provides even more features

declare-option -docstring "modules that provide fuzzyfinders" \
    str-list fuzzyfinder_providers "broot" "fzf"
declare-option -docstring "modules that bind fuzzyfinders" \
    str-list fuzzyfinder_binders "broot-bind" "fzf-bind"

hook -group fuzzyfind global KakBegin .* %{
    require-module detection
    load-all %opt{fuzzyfinder_providers}
    load-first %opt{fuzzyfinder_binders}
}
