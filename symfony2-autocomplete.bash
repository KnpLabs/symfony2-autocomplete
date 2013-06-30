#!bash
#
# bash completion support for symfony2 console
#
# Copyright (C) 2011 Matthieu Bontemps <matthieu@knplabs.com>
# Distributed under the GNU General Public License, version 2.0.

_symfony2_console()
{
    local cur prev opts
    COMPREPLY=()

    _get_comp_words_by_ref -n : cur prev

    opts=$(${1} | sed '1,/.*Available commands/d' | grep -o '^  .*  ')
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )

    __ltrim_colon_completions "$cur"
    return 0
}

complete -F _symfony2_console app/console
