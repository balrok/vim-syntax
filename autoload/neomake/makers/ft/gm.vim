function! neomake#makers#ft#gm#EnabledMakers() abort
    return ['grgcheck']
endfunction

function! neomake#makers#ft#gm#grgcheck() abort
    return {
		\ 'errorformat': '%t %f:%l:%c %m',
        \ }
endfunction
