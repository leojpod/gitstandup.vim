if !executable('git-standup')
  echoerr "no git-standup found, trying to install one via CURL"
  echo "try installing it with:"
  echo "curl -L https://raw.githubusercontent.com/kamranahmedse/git-standup/master/installer.sh | sudo sh"
  finish
end


if exists("g:git_standup_loaded")
  finish
end
let g:git_standup_loaded = 1

command! -nargs=* Gstandup lua require'standup'.show(<f-args>)

lua require'standup'.show()
