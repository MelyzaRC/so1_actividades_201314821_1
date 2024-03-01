#!/bin/bash

recibir() {
    while true; do
        if read line < user1_to_user2; then
            echo -e "📩 \e[1;93mUser 1:\e[0m $line"
            echo -e "\e[90m──────────────────────────────────────────\e[0m"
        fi
    done
}

enviar() {
    while true; do
        read message
        echo -ne "\033[1A\033[K"
        echo -e "📨 \e[1;31mYo:\e[0m $message"
        echo "$message" > user2_to_user1
        echo -e "\e[90m──────────────────────────────────────────\e[0m"
    done
}

recibir &
enviar