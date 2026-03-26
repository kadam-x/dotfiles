#!/usr/bin/env bash

declare -A ICONS=(
["github"]=""
["rust"]=""
["google"]=""
["private browsing"]=""
["librewolf"]=""
["nvim"]=""
["gthumb"]=""
[".pdf"]=""
["kitty-notes"]=""
["yazi"]="󰇥"
["tmux"]=""
["obsidian"]=""
["youtube music"]=""
["brave"]=""
["vesktop"]=""
["vlc"]="󰕼"
["youtube"]=""
["qutebrowser"]=""
["reddit"]=""
["twitch"]=""
["twitter"]=""
["x.com"]=""
["spotify"]=""
["netflix"]="󰝆"
["amazon"]=""
["steam"]=""
["discord"]="󰙯"
["slack"]=""
["signal"]="󰈹"
["telegram"]=""
["whatsapp"]=""
["zoom"]=""
["notion"]="󰎚"
["trello"]=""
["figma"]=""
["bitbucket"]=""
["gitlab"]=""
["stackoverflow"]=""
["duckduckgo"]="󰇥"
["wikipedia"]=""
["chatgpt"]="󰚩"
["outlook"]=""
["gmail"]=""
["calendar"]=""
["keep"]=""
["drive"]=""
["dropbox"]=""
["ssh"]=""
)

workspaces=$(niri msg --json workspaces)
windows=$(niri msg --json windows)

output=""
while IFS= read -r ws; do
    ws_id=$(echo "$ws" | jq -r '.id')
    ws_idx=$(echo "$ws" | jq -r '.idx')
    is_focused=$(echo "$ws" | jq -r '.is_focused')

    icons=""
    while IFS= read -r app_id; do
        [ -z "$app_id" ] && continue
        app_lower=$(echo "$app_id" | tr '[:upper:]' '[:lower:]')
        icon="${ICONS[$app_lower]:-󰘔}"
        icons="$icons$icon "
    done < <(echo "$windows" | jq -r --argjson id "$ws_id" '.[] | select(.workspace_id == $id) | .app_id')

    icons="${icons% }"

    if [ "$is_focused" = "true" ]; then
        entry="<span color='#c8c093'>$ws_idx</span> : $icons"
    else
        entry="<span color='#54546d'>$ws_idx : $icons</span>"
    fi

    [ -n "$output" ] && output="$output    "
    output="$output$entry"

done < <(echo "$workspaces" | jq -c '.[]' | sort -t'"' -k8 -n)

echo "{\"text\": \"$output\", \"class\": \"\", \"tooltip\": \"\"}"
