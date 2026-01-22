# Cursor Dark theme for Fish shell
#
# To install, run:
#   source /path/to/cursor-dark.fish
#
# Or add to ~/.config/fish/conf.d/cursor-dark.fish

# Syntax highlighting colors
set -U fish_color_normal E4E4E4 # default text
set -U fish_color_command 82D2CE # commands (keywords)
set -U fish_color_keyword 82D2CE # keywords
set -U fish_color_quote E394DC # strings
set -U fish_color_redirection 9CDCFE # redirections (>, <, |)
set -U fish_color_end 82D2CE # statement terminators (;, &&)
set -U fish_color_error FC6B83 # errors
set -U fish_color_param 9CDCFE # parameters/arguments
set -U fish_color_option F1B467 # options (--flag, -f)
set -U fish_color_comment 7A7A7A # comments
set -U fish_color_selection --background=404040 # selected text
set -U fish_color_operator E4E4E4 # operators ($, *, etc)
set -U fish_color_escape F8C762 # escape sequences (\n, \t)
set -U fish_color_autosuggestion 5A5A5A # autosuggestions
set -U fish_color_valid_path --underline # valid paths

# Completion pager colors
set -U fish_pager_color_progress 7A7A7A # progress bar
set -U fish_pager_color_prefix 88C0D0 --bold # matched prefix
set -U fish_pager_color_completion E4E4E4 # completion text
set -U fish_pager_color_description 7A7A7A # description
set -U fish_pager_color_selected_background --background=343434
set -U fish_pager_color_selected_prefix 88C0D0 --bold
set -U fish_pager_color_selected_completion E4E4E4
set -U fish_pager_color_selected_description 9A9A9A

# Search highlighting
set -U fish_color_search_match --background=404040
set -U fish_color_history_current 88C0D0 --bold

# CWD colors
set -U fish_color_cwd 88C0D0 # current directory
set -U fish_color_cwd_root FC6B83 # root user cwd

# User/host colors
set -U fish_color_user 70B489 # normal user
set -U fish_color_host E4E4E4 # hostname
set -U fish_color_host_remote F1B467 # remote hostname

# Git prompt colors (if using fish_git_prompt)
set -U __fish_git_prompt_color_branch 88C0D0
set -U __fish_git_prompt_color_dirtystate F1B467
set -U __fish_git_prompt_color_stagedstate 70B489
set -U __fish_git_prompt_color_untrackedfiles FC6B83
set -U __fish_git_prompt_color_upstream_ahead 70B489
set -U __fish_git_prompt_color_upstream_behind FC6B83

# Cancel command color
set -U fish_color_cancel FC6B83

# Status colors
set -U fish_color_status FC6B83 # non-zero exit status
