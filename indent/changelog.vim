" Vim indent file
" Language:	    generic Changelog file
" Author:       draftcode <draftcode@gmail.com>
" Last Change:	2008 september 20

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
   finish
endif
let b:did_indent = 1

setlocal indentexpr=ChangelogIndent()

if exists("*ChangelogIndent")
    finish
endif

function! ChangelogIndent()
    let pline = getline( v:lnum - 1 )
    let line  = getline( v:lnum )

    if line =~ '^\s\+\*\s.\+:\s\+'
        return &sw
    endif

    if pline =~ '^\s\+\*\s.\+:\s\+'
        return stridx( pline, ':' ) + 1 + &sw
    endif

    return indent( v:lnum - 1 )
endfunction
