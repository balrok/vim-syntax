function! neomake#makers#ft#grg#EnabledMakers() abort
    return ['grgcheck']
endfunction

function! neomake#makers#ft#grg#grgcheck() abort
    return {
		\ 'errorformat': '%t %f:%l:%c %m',
        \ }
endfunction
