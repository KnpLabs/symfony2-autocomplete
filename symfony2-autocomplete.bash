#!bash
#
# bash completion support for symfony2 console
#
# Copyright (C) 2011 Matthieu Bontemps <matthieu@knplabs.com>
# Distributed under the GNU General Public License, version 2.0.

_console()
{
    local cur prev cmd
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    cmd="${COMP_WORDS[0]}"
    PHP='$ret = shell_exec($argv[1] . " --no-debug --env=prod");

$comps = "";
if (preg_match_all("@^.*Available commands:\n^  ([^ ]+) @m", $ret, $m)) {
    $comps = $m[1];
}

echo implode("\n", $comps);
'
    possible=$($(which php) -r "$PHP" $COMP_WORDS);
    COMPREPLY=( $(compgen -W "${possible}" -- ${cur}) )
    return 0
}

complete -F _console console
complete -F _console console-dev
complete -F _console console-test
complete -F _console console-prod
complete -F _console console-staging
complete -F _console Symfony
COMP_WORDBREAKS=${COMP_WORDBREAKS//:}
