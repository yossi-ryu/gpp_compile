scriptencoding utf-8


" Load this module only once.
if exists('g:loaded_gpp_compile')
    finish
endif
let g:loaded_gpp_compile = '0.0.0 2019-05-12'

" ユーザー設定を一時退避
let s:save_cpo = &cpo
set cpo&vim

if !exists(":GppCompile")
    command GppCompile :call gpp_compile#compile(4)
endif

if !exists(":GppCompileShort")
    command GppCompileShort :call gpp_compile#compile(2)
endif

if !exists(":GppCompileTest")
    command GppCompileTest :call gpp_compile#test(4)
endif

if !exists(":GppCompileTestShort")
    command GppCompileTestShort :call gpp_compile#test(3)
endif

if !exists(":GppCompileCopy")
    command GppCompileCopy :call gpp_compile#copy()
endif

augroup gpp_compile
	autocmd!
	autocmd BufWritePost,FileWritePost,FileAppendPost *.cpp call gpp_compile#auto()
augroup END

" 退避していたユーザ設定を戻す
let &cpo = s:save_cpo
unlet s:save_cpo
