function fish_prompt --description 'Write out the prompt'
  set last_status $status
  if test $last_status != '0'
    printf '%s[%s] ' \
      (set_color red) \
      $last_status
  end

  printf '%s%s %s%s' \
    (set_color yellow) \
    (whoami) \
    (set_color purple) \
    (prompt_hostname)

  if git rev-parse --is-inside-work-tree > /dev/null 2>&1
    printf ' %s %s' \
      (set_color bryellow) \
      (git branch | grep \* | cut -d ' ' -f2)
  end

  printf ' %s%s%s> ' \
    (set_color green) \
    (prompt_pwd) \
    (set_color normal)
end
