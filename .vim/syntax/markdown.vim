" general
syn match pandocMathCommand         "\\\<\w\+\>\|\\\\" contained
syn match pandocMathCommandArgument "{\|}" contained
syn match pandocMathNumber          "[0-9]\|[0-9.]" contained
syn match pandocMathOperator        "_\|\^\|+\|-\|/\|*" contained
syn match pandocPreambleVariable    "[a-z-]\+[:=]" contained
syn match pandocCommand             "\\\<\w\+\>\|^---$"
syn match pandocHyperlink           "\[.*\]\((\)\@="
syn match pandocList                "\*\|-"

" regions
syn region pandocMathDisplay start="\$\$" end="\$\$" contains=pandocMathCommand,pandocMathCommandArgument,pandocMathNumber,pandocMathOperator
syn region pandocMathInline  start="\$\([A-z\\0-9(\[{]\)\@=" end="\([A-z0%-9\])}]\)\@<=\$" contains=pandocMathCommand,pandocMathCommandArgument,pandocMathNumber,pandocMathOperator
syn region pandocEmphasis    start="__" end="__"
syn region pandocEmphasis    start="\*\*" end="\*\*"
syn region pandocSection     start="^#" end="$"
syn region pandocCodeBlock   start="```" end="```"
syn region pandocPreamble    start="\%1l---$" end="^---$"
syn region pandocCodeInline  start="`" end="`"
syn region pandocTodo        start="\[ \]" end="$"
syn region pandocDone        start="\[x\]" end="$"
syn region pandocURL         start="\((\)\?https://\|https://\|www\." end="\s\|$\|)"
syn region pandocQuestion    start="Q:" end="?\|$"

" highlighting rules
hi def link pandocList Operator
if has('nvim')

    highlight pandocHyperlink           guifg=#00ffff       guibg=NONE      gui=UNDERLINE
    highlight pandocURL                 guifg=#0000ff       guibg=NONE      gui=UNDERLINE
    highlight pandocMathCommand         guifg=#000000      guibg=#004000 gui=NONE
    highlight pandocMathCommandArgument guifg=DarkYellow guibg=DarkGreen gui=NONE
    highlight pandocMathNumber          guifg=Red        guibg=DarkGreen gui=NONE
    highlight pandocMathOperator        guifg=Yellow     guibg=DarkGreen gui=NONE
    highlight pandocMathInline          guifg=Green      guibg=DarkGreen gui=NONE
    highlight pandocMathDisplay         guifg=Green      guibg=DarkGreen gui=NONE
    highlight pandocEmphasis            guifg=NONE       guibg=Black     gui=BOLD
    highlight pandocSection             guifg=DarkYellow guibg=NONE      gui=UNDERLINE
    highlight pandocCodeBlock           guifg=#000000      guibg=#606060  gui=NONE
    highlight pandocCodeInline          guifg=#000000      guibg=#606060  gui=NONE
    highlight pandocCommand             guifg=Cyan       guibg=DarkCyan  gui=NONE
    highlight pandocPreamble            guifg=DarkRed    guibg=Black     gui=NONE
    highlight pandocTodo                guifg=DarkRed    guibg=NONE      gui=NONE
    highlight pandocDone                guifg=DarkGreen  guibg=NONE      gui=NONE
    highlight pandocQuestion            guifg=Green      guibg=Black     gui=NONE

else

    highlight pandocHyperlink           ctermfg=Cyan       ctermbg=NONE       cterm=UNDERLINE
    highlight pandocURL                 ctermfg=Blue       ctermbg=NONE       cterm=UNDERLINE
    highlight pandocMathCommand         ctermfg=Black      ctermbg=DarkGreen  cterm=NONE
    highlight pandocMathCommandArgument ctermfg=DarkYellow ctermbg=DarkGreen  cterm=NONE
    highlight pandocMathNumber          ctermfg=Red        ctermbg=DarkGreen  cterm=NONE
    highlight pandocMathOperator        ctermfg=Yellow     ctermbg=DarkGreen  cterm=NONE
    highlight pandocMathInline          ctermfg=Green      ctermbg=DarkGreen  cterm=NONE
    highlight pandocMathDisplay         ctermfg=Green      ctermbg=DarkGreen  cterm=NONE
    highlight pandocEmphasis            ctermfg=NONE       ctermbg=Black      cterm=BOLD
    highlight pandocSection             ctermfg=NONE       ctermfg=DarkYellow cterm=UNDERLINE
    highlight pandocCodeBlock           ctermfg=Black      ctermbg=DarkGrey   cterm=NONE
    highlight pandocCodeInline          ctermfg=Black      ctermbg=DarkGrey   cterm=NONE
    highlight pandocCommand             ctermfg=Cyan       ctermbg=DarkCyan   cterm=NONE
    highlight pandocPreamble            ctermfg=DarkRed    ctermbg=Black      cterm=NONE
    highlight pandocTodo                ctermfg=DarkRed    ctermbg=NONE       cterm=NONE
    highlight pandocDone                ctermfg=DarkGreen  ctermbg=NONE       cterm=NONE
    highlight pandocQuestion            ctermfg=Green      ctermbg=Black      cterm=NONE

endif

" syntax options
syn case match
setlocal nospell
setlocal wrap
let b:current_syntax = "markdown"
