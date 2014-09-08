#!/usr/bin/env bash

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

SCM_THEME_PROMPT_PREFIX=""
SCM_THEME_PROMPT_SUFFIX=""

SCM_THEME_PROMPT_DIRTY=" ${bold_red}✗${normal}"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}✓${normal}"
SCM_GIT_CHAR="${bold_green}⑆${normal}"

modern_scm_prompt() {
        CHAR=$(scm_char)
        if [ $CHAR = $SCM_NONE_CHAR ]
        then
                return
        else
                echo " [$(scm_char)]${blue}[${bold_white}$(scm_prompt_info)${normal}${blue}] "
        fi
}

function prompt_command() {
    PS1="${blue}[\T] ${green}[\u@\h] ${white}\w${normal}$(modern_scm_prompt)${bold_blue} → ${normal}";
}

PROMPT_COMMAND=prompt_command;

