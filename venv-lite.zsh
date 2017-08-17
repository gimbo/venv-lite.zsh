
# My mini virtualenvwrapper plugin

_venvs_path() {
    echo ~/.virtualenvs
}

_venv_path() {
    echo "$(_venvs_path)/$1"
}

rmvirtualenv () {
    rm -rvf $(_venv_path $1)
}

mkvirtualenv () {
    python -m venv $(_venv_path $1)
    workon $1
}

workon () {
    source $(_venv_path $1)/bin/activate
}

_venv_completion () {
    _path_files -/ -W "$(_venvs_path)"
}

compdef _venv_completion workon rmvirtualenv
