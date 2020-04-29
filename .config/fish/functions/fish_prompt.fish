function fish_prompt --description 'Write out the prompt, prepending the Debian chroot environment if present'
    # Set variable identifying the chroot you work in (used in the prompt below)
    if not set -q debian_chroot
        and test -r /etc/debian_chroot
        set debian_chroot (cat /etc/debian_chroot)
    end
    if not set -q __fish_debian_chroot_prompt
        and set -q debian_chroot
        and test -n "$debian_chroot"
        set -g __fish_debian_chroot_prompt "($debian_chroot)"
    end

    # Prepend the chroot environment if present
    if set -q __fish_debian_chroot_prompt
        echo -n -s (set_color yellow) "$__fish_debian_chroot_prompt" (set_color normal) ' '
    end

    switch "$USER"
        case root toor
            echo -n -s "$USER" @ (prompt_hostname) ' ' (set -q fish_color_cwd_root
                                                        and set_color $fish_color_cwd_root
                                                        or set_color $fish_color_cwd) (prompt_pwd) \
                (set_color normal) '# '

        case '*'
            echo -n -s "$USER" @ (prompt_hostname) ' ' (set_color $fish_color_cwd) (prompt_pwd) \
                (set_color normal) '> '

    end
end


function fish_greeting
end
