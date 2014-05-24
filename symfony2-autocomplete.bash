#!bash
#
# bash completion support for symfony2 console
#
# Copyright (C) 2011 Matthieu Bontemps <matthieu@knplabs.com>
# Distributed under the GNU General Public License, version 2.0.

_console()
{
    local cur prev script
    COMPREPLY=()
    _get_comp_words_by_ref -n : cur prev
    script="${COMP_WORDS[0]}"

    if [[ ${cur} == -* ]] ; then
        PHP=$(cat <<'HEREDOC'
array_shift($argv);
$script = array_shift($argv);
$command = '';
foreach ($argv as $v) {
    if (0 !== strpos($v, '-')) {
        $command = $v;
        break;
    }
}

$xmlHelp = shell_exec($script.' help --xml '.$command);
$options = array();
if (!$xml = @simplexml_load_string($xmlHelp)) {
    exit(0);
}
foreach ($xml->xpath('/command/options/option') as $option) {
    $options[] = (string) $option['name'];
}

echo implode(' ', $options);
HEREDOC
)

        args=$(printf "%s " "${COMP_WORDS[@]}")
        options=$($(which php) -r "$PHP" ${args});
        COMPREPLY=($(compgen -W "${options}" -- ${cur}))

        return 0
    fi

    commands=$(${script} list --raw | sed -E 's/(([^ ]+ )).*/\1/')
    COMPREPLY=($(compgen -W "${commands}" -- ${cur}))

    __ltrim_colon_completions "$cur"
    return 0;
}

complete -F _console console
complete -F _console console-dev
complete -F _console console-test
complete -F _console console-prod
complete -F _console console-staging
complete -F _console Symfony
