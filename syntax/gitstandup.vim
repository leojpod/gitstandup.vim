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

syntax match commitHash "\v(\d|[a-f]){7}" nextgroup=commitMessage

syntax match commitMessage "\v - .*\(.+\) " nextgroup=commitAuthor
syntax match commitAuthor "<\w+>"


" highlight link GitstandupFile Identifier
highlight link projectURI Title
highlight link commitHash Keyword
highlight link commitMessage String
highlight link commitAuthor Identifier


let b:current_syntax = 'gitstandup'
