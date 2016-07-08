[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# source "$HOME/.rvm/scripts/rvm"

source ~/.aliases.bash

# export SECRET_KEY_BASE='85eab9c08c03b74bf1b1accd6b72224edfa283d9e66f6a16f129f5546f8fe0a5280c28568086da3605637f8bb137a98711f445aade25c08e6c220d0857877e1b'
# export S3_BUCKET_NAME=wayoutthere
# export AWS_ACCESS_KEY_ID='AKIAJZJSPHH4ESF6QNAQ'
# export AWS_SECRET_ACCESS_KEY='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'
# alias subl="/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl"
#[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# Load rvm so you can access Ruby


# Take you to the dir of a file in a gem. e.g. `2gem rspec`
2gem () {
  cd "$(dirname $(gem which $1))"
}

# give the fullpaths of files passed in argv or piped through stdin
function fullpath {
  ruby -e '
    $stdin.each_line { |path| puts File.expand_path path }  if ARGV.empty?
    ARGV.each { |path| puts File.expand_path path }         unless ARGV.empty?
  ' "$@"
}

# Enable git's tab-completion library
source /usr/local/etc/bash_completion.d/git-completion.bash

# Prompt
  function parse_git_branch {
    branch=`git rev-parse --abbrev-ref HEAD 2>/dev/null`
    if [ "HEAD" = "$branch" ]; then
      echo "(no branch)"
    else
      echo "$branch"
    fi
  }

  function prompt_segment {
    # for colours: http://en.wikipedia.org/wiki/ANSI_escape_code#Colors
    # change the 37 to change the foreground
    # change the 45 to change the background
    if [[ ! -z "$1" ]]; then
      echo "\[\033[${2:-37};41m\]${1}\[\033[0m\]"
    fi
  }

  function build_mah_prompt {
    # time

    ps1="$(prompt_segment " \@ ")"

    # cwd
    ps1="${ps1} $(prompt_segment " \w ")"

    # git branch
    git_branch=`parse_git_branch`
    if [[ ! -z "$git_branch" ]]
    then
      ps1="${ps1} $(prompt_segment " $git_branch " 32)"
      ps1="${ps1} $(prompt_segment " $(git_status_message) " 32)"
    fi

    # next line
    ps1="${ps1}\n\$ "

    # set prompt output
    export PS1="\W \[\033[0;33m\]⚡\[\033[0;39m\] "
    export CLICOLOR=1
    export LSCOLORS=ExFxBxDxCxegedabagacad
    PS1="$ps1"

  }

  PROMPT_COMMAND='build_mah_prompt'

  function git_status_message {
    git_status=`git status 2> /dev/null`

    if [[ $git_status =~ "nothing to commit" ]]; then
      echo "Clean"
    else
      echo "Unclean"
    fi
  }
