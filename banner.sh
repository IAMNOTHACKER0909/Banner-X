 #!/bin/bash
echo -e "\e[1;94m[*]\e[0m \e[1;92mDownloading..please wait......\e[0m"
# Colors
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
COLORSS=("$RED" "$GREEN" "$YELLOW" "$BLUE" "$MAGENTA" "$CYAN")
RANDOM_COLORR=${COLORSS[$RANDOM % ${#COLORS[@]}]}
# Show Banner
Rakibul() {
    echo -e "${RANDOM_COLOR}"
    echo -e "   ██████╗  █████╗ ███╗   ██╗███╗   ██╗███████╗██████╗"
    echo -e "   ██╔══██╗██╔══██╗████╗  ██║████╗  ██║██╔════╝██╔══██╗"
    echo -e "   ██████╔╝███████║██╔██╗ ██║██╔██╗ ██║█████╗  ██████╔╝"
    echo -e "   ██╔══██╗██╔══██║██║╚██╗██║██║╚██╗██║██╔══╝  ██╔══██╗"
    echo -e "   ██████╔╝██║  ██║██║ ╚████║██║ ╚████║███████╗██║  ██║"
    echo -e "   ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝"
    echo -e "${RESET}"
}
show_banner() {
    echo -e "\e[1;35m      +----------------------------------------+\e[0m"
    echo -e "\e[1;35m      |\e[1;33m Code   : ★ Rakibul ★                   \e[1;35m|\e[0m"
    echo -e "\e[1;35m      |\e[1;33m Github : https://github.com/Rakibul0909\e[1;35m|\e[0m"
    echo -e "\e[1;35m      |\e[1;33m YouTube: ?                             \e[1;35m|\e[0m"
    echo -e "\e[1;35m      +----------------------------------------+\e[0m"
}
animation() {

local pid=$!
local delay=0.25
local spinner=( '█■■■■' '■█■■■' '■■█■■' '■■■█■' '■■■■█' )

while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do

for i in "${spinner[@]}"
do
        tput civis
        echo -ne "\e[1;94m\r[*] Downloading...please wait.........\e[33m[\033[32m$i\033[33m]\033[0m   ";
        sleep $delay
        printf "\b\b\b\b\b\b\b\b";
done
done
printf "   \b\b\b\b\b"
tput cnorm
printf "\e[1;33m [Done]\e[0m";
echo "";

}

# Install Required Packages
install_pkg() {
    if ! command -v "$1" &> /dev/null; then
        echo -e "\e[94m[*]\e[0m \e[92mInstalling $1...\e[0m"
        pkg install "$1" -y
    fi
}

# Termux Setup
setup_termux() {
    pkill -9 apt
    pkill -9 dpkg
    pkill -9 pkg
    rm -rf /data/data/com.termux/cache/apt/archives/lock
    rm -rf /data/data/com.termux/files/usr/var/lib/dpkg/lock
    rm -rf /data/data/com.termux/files/usr/var/lib/dpkg/lock-frontend
    echo ""
    echo -e "\e[1;94m[*]\e[0m \e[1;92mUpdating Termux...\e[0m"
    pkg update -y && pkg upgrade -y
    install_pkg ruby
    install_pkg figlet
    install_pkg toilet
    install_pkg wget
    install_pkg boxes
    install_pkg zsh
    install_pkg curl
    install_pkg git
    gem install lolcat
    echo -e "${GREEN}Termux setup complete!${RESET}"
}

setup_ohmyzsh() {
    if [ -d "$HOME/.oh-my-zsh" ]; then

        rm -rf "$HOME/.oh-my-zsh"
    fi
    echo ""
    echo -e "\e[1;94m[*]\e[0m \e[1;92mInstalling Oh My Zsh...\e[0m"
    git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
    echo ""
    echo -e "${GREEN}Oh My Zsh Installing complete!${RESET}"
    sleep 2
}
install_autosuggestions() {
    echo ""
    echo -e "\e[1;94m[*]\e[0m \e[1;92mInstalling Autosuggestions...\e[0m"

    if [ -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
        rm -rf "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
    fi

    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    echo ""
    echo -e "${GREEN}Installing complete!${RESET}"
sleep 2
}

install_highlighting() {
    echo ""
    echo -e "\e[1;94m[*]\e[0m \e[1;92mInstalling Syntax Highlighting...\e[0m"

    if [ -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
        rm -rf "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
    fi

    git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting 
    echo ""
    echo -e "${GREEN}Installing complete!${RESET}"
sleep 2
}
install_figlet() {
    echo ""
    echo -e "\e[1;94m[*]\e[0m \e[1;92mInstalling Custom Figlet Font...\e[0m"
    mkdir -p "$HOME/.figlet"
    cd "$HOME/.figlet"
    wget -q "https://raw.githubusercontent.com/xero/figlet-fonts/master/ANSI%20Shadow.flf"
    cd ~
    echo ""
    echo -e "${GREEN}Custom Figlet Installed!${RESET}"
sleep 2
}

# Setup Banner
setup_banner() {
    clear
    figlet -f ~/.figlet/ANSI\ Shadow.flf "H4CKCR" | boxes -d ansi-heavy | lolcat
    echo ""
    read -p $'\e[1;4;95mEnter Banner Name ⟩ \e[0m ' banner_name
    echo ""
    echo ""
    read -p $' \e[1;4;95mEnter Shell Name ⟩ \e[0m ' shell_name
    echo ""
    echo -e "\e[1;32m[✓] Successfully Set Up Banner 😁"
    sleep 2
    echo ""

    cat <<EOF > ~/.zshrc
clear
figlet -f ~/.figlet/ANSI\ Shadow.flf "$banner_name" | boxes -d ansi-heavy | lolcat
source $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
echo ""
PROMPT="%F{green}┌─[%F{red}$shell_name💀localhost%F{green}]─[%F{blue}%~%F{green}]
%F{green}└──► %F{blue}❯❯❯ %F{green}"
EOF

    chsh -s zsh
    echo -e "${GREEN}Banner Successfully Set Up! Restart Termux.${RESET}"
sleep 2
}

cursor() {
    mkdir -p ~/.termux
    echo "background = #282a36" > ~/.termux/colors.properties
    echo "cursor = #00FFFF" >> ~/.termux/colors.properties
    echo ""
    echo -e "${GREEN}Cursor and Background setup Successfully!${RESET}"
    sleep 2
}
remove_banner() {
    rm -f ~/.zshrc
    rm -f ~/.bashrc
    echo -e "${RED}Banner Removed Successfully!${RESET}"
}

while true; do
    clear
    Rakibul
    show_banner
    echo -e "${RANDOM_COLOR}========================================${REAST}"
    echo -e "${RANDOM_COLORR}        welcome to Banner-X${RESET}"
    echo -e "${RANDOM_COLOR}========================================${RESET}"
    echo -e " ${CYAN}[${GREEN}1${CYAN}] Termux Setup${RESET}"
    echo -e " ${CYAN}[${GREEN}2${CYAN}] Install Oh My Zsh${RESET}"
    echo -e " ${CYAN}[${GREEN}3${CYAN}] Install Autosuggestions${RESET}"
    echo -e " ${CYAN}[${GREEN}4${CYAN}] Install Syntax Highlighting${RESET}"
    echo -e " ${CYAN}[${GREEN}5${CYAN}] cursor setup"
    echo -e " ${CYAN}[${GREEN}6${CYAN}] Install Figlet Font${RESET}"
    echo -e " ${CYAN}[${GREEN}7${CYAN}] Setup Banner${RESET}"
    echo -e " ${CYAN}[${GREEN}8${CYAN}] Exit${RESET}"
    echo -e "${RANDOM_COLOR}========================================${RESET}"
    echo ""

    read -p $'\e[1;92m[*] Choose an Option ⟩ \e[0m' option

    case $option in
        1) setup_termux ;;
        2) setup_ohmyzsh ;;
        3) install_autosuggestions ;;
        4) install_highlighting ;;
        5) cursor setup ;;
        6) install_figlet ;;
        7) setup_banner ;;
        8) echo "Exiting..."; exit 0 ;;
        *) echo -e "${RED}Invalid Option!${RESET}"; sleep 2 ;;
    esac
done
