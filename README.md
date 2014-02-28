## Not actively maintained

This project is not actively maintained by KnpLabs. Please contact us if you would like to take over.

# Symfony2 autocomplete

This is a very simple script to autocomplete symfony2 commands in a bash shell.

It easier to install than the KnplabsSymfony2AutocompleteBundle because it is only a single file.
No need to change anything in your Symfony2 project.

The script itself is not nice (you'll discover some PHP inside ) - but it gets the job done and could be useful to some people.

## Install

Download the `symfony2-autocomplete.bash`.

For example, if you want to be able to pull the changes in the future:

    cd ~/Sites/
    git clone https://github.com/KnpLabs/symfony2-autocomplete

Now edit your `bashrc`.

**MacOS:**

    mate ~/.bash_profile

Add a `source` command at the end:

    source ~/Sites/symfony2-autocomplete/symfony2-autocomplete.bash

**Linux:**

*`bash-completion` must be installed.*

    cp symfony2-autocomplete.bash /etc/bash_completion.d/

Add the following line to your `~/.bashrc` or `.bash_profile`:

    if [ -e ~/symfony2-autocomplete.bash ]; then
        . ~/symfony2-autocomplete.bash
    fi

Restart your bash and you should be able to autocomplete in a Symfony2 project:

    ./app/console doc[TAB]
