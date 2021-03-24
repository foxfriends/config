declare-option -docstring "modules which provide a terminal command" str-list term_providers "term-kitty"

hook -group grep global KakBegin .* %{
    load-first %opt{term_providers}
}
