# Vim

* start recording: press `q` then any letter to define a register

* `netrw`
	* `:Explore`: opens `netrw` in the current window
	* `:Sexplore`: opens `netrw` in the horizontal split
	* `:Vexplore`: opens `netrw` in a vertical split

* replace:
  * replace first occurence: `:%s/foo/bar/g`
  * replace all: `:%s/foo/bar/g`
  * replace between two lines: `:6,10s/foo/bar/g`
  * replace between from one line to the end of file: `:6,$s/foo/bar/g`
  * add character at end of line: `:%s/$/\*/g`

* disable swap files: `set noswapfile`
* select pasted text: `gv`
* full page down: Ctrl + f
* half page down: Ctrl + d
* full page up: Ctrl + b
* half page up: Ctrl + u

## record commands
* start recording: `q<key>`
* end recording: `q`
* play record: `@<key>`
