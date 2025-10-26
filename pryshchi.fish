function fish_right_prompt
    set -l duration
    if test $CMD_DURATION -gt 1000
        set -l seconds (math "round($CMD_DURATION / 1000)")
        set duration $seconds s
    end

    echo -s \
        (set_color -d) \
        $duration \
        (set_color normal)
end

function fish_prompt
    set -l last_status $status

    set -l stat
    if test $last_status -ne 0
        set stat (set_color red)" [$last_status]"
    end

    set -l user (set_color AEA79F) $USERNAME
    if fish_is_root_user
        set stat (set_color ED764D) root
    end

    echo -s \
        (set_color AEA79F) $hostname \
        (set_color normal) ":" \
        (set_color F4AA90) (prompt_pwd --full-length-dirs 2) \
        " " $user \
        (set_color 806678) (fish_git_prompt) \
        $stat \
        (set_color normal) " "
end

set -g __fish_git_prompt_show_informative_status true
set -g __fish_git_prompt_showuntrackedfiles true
