This is a challenging task since we cannot use git at run time.

The workaround is downloading all git repos at build time and run installation at run time.

This is because pyenv installation is tightly coupled with PYENV_ROOT or "${HOME}/.pyenv".
