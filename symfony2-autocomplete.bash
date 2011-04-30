#!bash
#
# bash completion support for symfony2 console
#
# Copyright (C) 2011 Matthieu Bontemps <matthieu@knplabs.com>
# Distributed under the GNU General Public License, version 2.0.

_console() 
{
    local cur prev opts cmd
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    cmd="${COMP_WORDS[0]}"
    PHP='$ret = shell_exec($argv[1]);

$ret = preg_replace("/^.*Available commands:\n/s", "", $ret);
$ret = explode("\n", $ret);

$base = "";
$comps = array();
foreach($ret as $line) {
    if(preg_match("@^  ([^ ]+) @", $line, $m)) {
        $comps[] = $base.$m[1];
    } else {
        $base = $line;
    }
}

$comps = implode("\n", $comps);
echo $comps;
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