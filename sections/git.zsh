#
# Git
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_GIT_SHOW="${SPACESHIP_GIT_SHOW=true}"
SPACESHIP_GIT_ASYNC="${SPACESHIP_GIT_ASYNC=true}"
SPACESHIP_GIT_PREFIX="${SPACESHIP_GIT_PREFIX="on "}"
SPACESHIP_GIT_SUFFIX="${SPACESHIP_GIT_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_GIT_SYMBOL="${SPACESHIP_GIT_SYMBOL=" "}"

# ------------------------------------------------------------------------------
# Dependencies
# ------------------------------------------------------------------------------

source "$SPACESHIP_ROOT/sections/git_branch.zsh"
source "$SPACESHIP_ROOT/sections/git_status.zsh"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show both git branch and git status:
#   spaceship_git_branch
#   spaceship_git_status
spaceship_git() {
  [[ $SPACESHIP_GIT_SHOW == false ]] && return

  local git_branch="$(spaceship_git_branch)"
  local git_status="$(spaceship_git_status)"

  [[ -z $git_branch ]] && return

  local git_branch_section="$(spaceship::render_section $git_branch)"
  local git_status_section="$(spaceship::render_section $git_status)"

  spaceship::section \
    --color 'white' \
    --prefix "$SPACESHIP_GIT_PREFIX" \
    --syffix "$SPACESHIP_GIT_SUFFIX" \
    "$git_branch_section$git_status_section"
}
