function! SwitchName(flag)
python << EOF
import vim

num = vim.current.range.start
line = vim.current.buffer[num]
flag = vim.eval('a:flag')

def underscore(num, line) : 
    res = ''
    for char in line:
        if char.isupper():
            res += '_' + char.lower()
        else:
            res += char
    return res

def camel(num, line): 
    res = ''
    for word in line.split('_'):
        if word == '':
            continue
        if len(res) == 0:
            res += word.lower()
        else:
            res += word[0].upper() + word[1:]
    return res


if flag == '_': 
    res = underscore(num, line)
else:
    res = camel(num, line)

vim.current.buffer[num] = res;


EOF
endfunction

" data_pick dataPick
" data_pick dataPick
" data_pick dataPick
" DataPick dataPick

command! -nargs=0 -range Underscore call SwitchName('_')
command! -nargs=0 -range Camel call SwitchName('+')
