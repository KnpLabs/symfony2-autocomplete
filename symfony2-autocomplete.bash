#!bash
#
# bash completion support for symfony2 console
#
# Copyright (C) 2011 Matthieu Bontemps <matthieu@knplabs.com>
# Distributed under the GNU General Public License, version 2.0.

_console()
{
    local cur prev opts
    COMPREPLY=()

    _get_comp_words_by_ref -n : cur prev

    opts=$(${1} | sed '1,/.*Available commands/d' | grep -o '^  .*  ')
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )

    __ltrim_colon_completions "$cur"
    return 0
}

complete -F _console console
complete -F _console console-dev
complete -F _console console-test
complete -F _console console-prod
complete -F _console console-staging
complete -F _console Symfony
COMP_WORDBREAKS=${COMP_WORDBREAKS//:}
