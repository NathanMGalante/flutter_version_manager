#!/bin/bash

no_color='\033[0m'
color_gold='\033[0;33m'
color_green='\033[0;32m'
color_ltgreen='\033[1;32m'
color_yellow='\033[1;33m'
color_red='\033[1;31m'

scriptPath="$(cd -- "$(dirname -- "${BASH_SOURCE[0]:-$0}")" &>/dev/null && pwd 2>/dev/null)"
defaultPath="${scriptPath}/flutter"
versionsPath=$(find $scriptPath/* -maxdepth 0 -type d -exec test -e "{}/common/flutter/version" \; -print)

if [ -z "$versionsPath" ]; then

  echo ""
  echo -e "${color_red}[ERROR]${no_color} No flutter version found in current directory"
  
else

  currentVersion=$(head -n1 "${scriptPath}/flutter/common/flutter/version")
  
  if [ -z "$currentVersion" ]; then
  
    echo ""
    echo -e "${color_red}[ERROR]${no_color} Could not identify the current version"
  
  else
  
    readarray -t versions < <(for dir in ${versionsPath}; do [ -f "${dir}/common/flutter/version" ] && echo $(head -n1 "${dir}/common/flutter/version"); done | sort)

    position=$(echo "${versions[@]}" | tr ' ' '\n' | grep -n "$currentVersion" | cut -d ':' -f 1 | awk '{print $1-1}')

    selectedVersion=""

    function print_versions {
      for ((i = 0; i < ${#versions[@]}; i++)); do
        if [ $i -eq $position ]; then
          echo -e "${color_gold}-> Flutter ${versions[$i]:0:1} (v${versions[$i]})${no_color}"
        elif [ "${versions[$i]}" == "$currentVersion" ]; then
          echo -e "   ${color_green}Flutter ${versions[$i]:0:1} (v${versions[$i]})${no_color}\r"
        else
          echo -e "   ${no_color}Flutter ${versions[$i]:0:1} (v${versions[$i]})${no_color}\r"
        fi
      done
    }

    function clear_versions {
      tput cuu ${#versions[@]}
      printf '\033[J'
    }

    echo "Choose a version: "
    print_versions

    while true; do
      read -rsn1 input
      if [ "$input" == "A" ] && [ $position -gt 0 ]; then
        ((position--))
        clear_versions
        print_versions
      elif [ "$input" == "B" ] && [ $position -lt $((${#versions[@]} - 1)) ]; then
        ((position++))
        clear_versions
        print_versions
      elif [ "$input" == "" ]; then
        selectedVersion=${versions[$position]}
        break
      fi
    done

    echo ""

    if [ "$selectedVersion" == "$currentVersion" ]; then
      echo -e "${color_yellow}[WARNING] ${color_green}This is already the current version!${no_color}"
    else
      echo "[INFO] Changing version..."

      newVersionDir=$(find ${versionsPath} -mindepth 3 -maxdepth 3 -type f -name "version" -exec sh -c 'test "$(head -n1 "$1")" = "$0" && echo "${1%/*/*/*}" && exit 0' "$selectedVersion" {} \;)
  
      mv "$defaultPath" "${defaultPath}${currentVersion}"
      mv "$newVersionDir" "$defaultPath"

      newVersion="$(head -n 1 "${defaultPath}/common/flutter/version")"

      echo -e "${no_color}[INFO] Changed Flutter version!${no_color}"
      echo ""
      echo -e "${no_color}New version: ${color_ltgreen}v${newVersion}${no_color}"
    fi
  
  fi

fi

echo ""


