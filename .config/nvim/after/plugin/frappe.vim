function! SetupEnvironment()
	let l:path = expand('%:p')
	if l:path =~ '/home/balu-work/Documents/code/frappe-bench/apps/'
		"add common to all file config here with setlocal
		if &filetype == 'python'
			"add filetype specific like this
			setlocal sw=0 sts=0 tabstop=4 noexpandtab
			" setlocal makeprg=python\ -m\ unittest\ %
			compiler! pyunit
			set efm=%A\ \ File\ \"/home/balu-work/Documents/code/frappe-bench/apps/press/%f\"\\,\ line\ %l%.%#
		elseif &filetype == 'vue'
			setlocal sw=0 sts=0 tabstop=2 noexpandtab
			setlocal makeprg=npx\ eslint\ %\ --fix 
		elseif &filetype == 'javascript'
			setlocal sw=2 sts=2 tabstop=8 expandtab
		endif
		"add subsequent project directories like this
	elseif l:path =~ '/home/balu-work/Documents/code/agent/repo/'
		setlocal makeprg=python\ -m\ unittest
		compiler! pyunit
	elseif l:path =~ '/home/balu-work/Documents/code/bench-repo/'
		if &filetype == 'python'
			setlocal sw=0 sts=0 tabstop=4 noexpandtab
			" setlocal makeprg=python\ -m\ unittest\ %
			compiler! pyunit
		endif
	elseif l:path =~ '/home/balu-work/projects'
		setlocal tabstop=4 shiftwidth=4 noexpandtab
	endif
endfunction
autocmd! BufReadPost,BufNewFile * call SetupEnvironment()

augroup nginx_syntax
  au!
  autocmd BufNewFile,BufRead *.conf.jinja2 setlocal ft=nginx.jinja2
augroup END

