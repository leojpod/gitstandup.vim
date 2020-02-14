" Vim syntax file
" Language: Gitstandup buffer blurp
" Maintainer: Leo jPod
" Latest Revision: 8th Feb 2020

if exists("b:current_syntax")
  finish
end

syn sync fromstart

syntax match projectURI "\v^(\/[^\/\n]+)+$"
syntax match projectURI "\v^(\\[^\\\n]+)+"

syntax match commitHash "\v^(\d|[a-f])+ " nextgroup=commitMessage

syntax match commitMessage "\v- .*\(.+\)\s*" nextgroup=commitAuthor
syntax match commitAuthor "\v\<.+\>.*$"


" highlight link GitstandupFile Identifier
highlight link projectURI Title
highlight link commitHash Keyword
highlight link commitMessage String
highlight link commitAuthor Identifier


let b:current_syntax = 'gitstandup'
