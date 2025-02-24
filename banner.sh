#!/bin/bash
RED='\e[1;91m'
GREEN='\e[1;92m'
YELLOW='\e[1;93m'
BLUE='\e[1;94m'
MAGENTA='\e[1;95m'
CYAN='\e[1;96m'
WHITE='\e[1;97m'
RESET='\e[0m'

COLORS=("$RED" "$GREEN" "$YELLOW" "$BLUE" "$MAGENTA" "$CYAN")

RANDOM_COLOR=${COLORS[$RANDOM % ${#COLORS[@]}]}
sleep 1
clear
Rakibul() {
    echo -e "${RANDOM_COLOR}"
    echo -e "   ██████╗  █████╗ ███╗   ██╗███╗   ██╗███████╗██████╗     "
    echo -e "   ██╔══██╗██╔══██╗████╗  ██║████╗  ██║██╔════╝██╔══██╗    "
    echo -e "   ██████╔╝███████║██╔██╗ ██║██╔██╗ ██║█████╗  ██████╔╝    "
    echo -e "   ██╔══██╗██╔══██║██║╚██╗██║██║╚██╗██║██╔══╝  ██╔══██╗    "
    echo -e "   ██████╔╝██║  ██║██║ ╚████║██║ ╚████║███████╗██║  ██║    "
    echo -e "   ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝    "
    echo -e "${RESET}"
}
show_banner() {
    echo -e "\e[1;35m      +----------------------------------------+\e[0m"
    echo -e "\e[1;35m      |\e[1;33m Code   : ★ Rakibul ★                   \e[1;35m|\e[0m"
    echo -e "\e[1;35m      |\e[1;33m Github : https://github.com/Rakibul0909\e[1;35m|\e[0m"
    echo -e "\e[1;35m      |\e[1;33m YouTube: ?                             \e[1;35m|\e[0m"
    echo -e "\e[1;35m      +----------------------------------------+\e[0m"
}

install_pkg() {
    if ! command -v "$1" &> /dev/null; then
        echo -e "\e[94m[*]\e[0m \e[92mInstalling $1...\e[0m"
        pkg install "$1" -y
    fi
}

setup_termux() {
    pkill -9 apt
    pkill -9 dpkg
    pkill -9 pkg
    rm -rf /data/data/com.termux/cache/apt/archives/lock
    rm -rf /data/data/com.termux/files/usr/var/lib/dpkg/lock
    rm -rf /data/data/com.termux/files/usr/var/lib/dpkg/lock-frontend
    echo""
    echo -e "\e[94m[*]\e[0m \e[92mUpdating Termux...\e[0m"
    echo""
    pkg update -y && pkg upgrade -y
    apt update -y && apt upgrade -y
    install_pkg ruby
    install_pkg figlet
    install_pkg toilet
    install_pkg wget
    install_pkg boxes
    install_pkg zsh
    install_pkg curl
    install_pkg git
if ! command -v lolcat &> /dev/null; then                                                   echo -e "\e[94m[*]\e[0m \e[92mInstalling lolcat...\e[0m"
    gem install lolcat
fi   
    echo ""
    echo -e "${GREEN}Termux setup complete!${RESET}"
    sleep 2
    clear
}

setup_ohmyzsh() {
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        echo -e "\e[94m[*]\e[0m \e[92mSetting up Oh My Zsh...\e[0m"
        git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
    fi
    echo ""
    echo -e "${GREEN}Oh My Zsh setup complete!${RESET}"
    sleep 2
    clear
}

install_autosuggestions() {
    git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    echo ""
    echo -e "${GREEN}Zsh autosuggestions installed!${RESET}"
    sleep 2
    clear
}

install_highlighting() {
    git clone https://github.com/zsh-users/zsh-syntax-highlighting $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    echo ""
    echo -e "${GREEN}Zsh syntax highlighting installed!${RESET}"
    sleep 2
    clear
}

install_figlet() {
    mkdir -p ~/.figlet
    cd ~/.figlet
    if [ ! -f "ANSI Shadow.flf" ]; then
        wget -q "https://raw.githubusercontent.com/xero/figlet-fonts/master/ANSI%20Shadow.flf"
    fi
    cd ~
    echo ""
    echo -e "${GREEN}Custom Figlet font installed!${RESET}"
    sleep 2
    clear
}

banner() {
    clear
    figlet -f ~/.figlet/ANSI\ Shadow.flf "H4CKCR" | boxes -d ansi-heavy | lolcat
    echo ""
    read -p $'\e[1;4;95mEnter Banner_name ⟩ \e[0m ' banner_name
    echo ""
    echo ""
    read -p $'\e[1;4;95mEnter Shell_name  ⟩ \e[0m ' shell_name
    echo""
    echo ""
    echo -e "\e[1;32m[✓] Successfully banner setup 😁"
    sleep 2
    echo ""
    clear
    cat <<EOF > ~/.zshrc
clear
figlet -f ~/.figlet/ANSI\ Shadow.flf "$banner_name" | boxes -d ansi-heavy | lolcat
source $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
echo""
PROMPT="%F{green}┌─[%F{red}$shell_name💀localhost%F{green}]─[%F{blue}%~%F{green}]
%F{green}└──► %F{blue}❯❯❯ %F{green}"
EOF
    chsh -s zsh
}

remove_banner() {
    rm -f ~/.zshrc
    rm -f ~/.bashrc
    echo ""
    echo -e "${RED}Banner removed successfully!${RESET}"
    sleep 2
    clear
}

while true; do
    clear
    Rakibul
    show_banner
    echo ""
    echo -e " ${CYAN}1. Termux setup${RESET}"
    echo -e " ${CYAN}2. Oh My Zsh setup${RESET}"
    echo -e " ${CYAN}3. Autosuggestions setup${RESET}"
    echo -e " ${CYAN}4. Syntax highlighting setup${RESET}"
    echo -e " ${CYAN}5. Figlet setup${RESET}"
    echo -e " ${CYAN}6. Banner setup${RESET}"
    echo -e " ${CYAN}7. Exit${RESET}"
    echo ""

    read -p $'\e[1;92mSet option ⟩ \e[0m' option

    case $option in
        1) setup_termux ;;
        2) setup_ohmyzsh ;;
        3) install_autosuggestions ;;
        4) install_highlighting ;;
        5) install_figlet ;;
        6) banner ;;
        7) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid option!" ;;
    esac
done
