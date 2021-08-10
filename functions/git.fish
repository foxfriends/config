function c --description 'git fuzzy-checkout'
  if test $argv[1] = '-'
    git checkout -
  else
    git branch | sed 's/^\*//' | string trim | fzf -1 -0 -q "$argv" | xargs git checkout
  end
end
