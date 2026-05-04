#!/data/data/com.termux/files/usr/bin/bash

# ── Colors ────────────────────────────────────────────────────────────────

R='\e[1;31m' # Red
G='\e[1;32m' # Green
Y='\e[1;33m' # Yellow
P='\e[1;35m' # Purple
C='\e[1;36m' # Cyan
N='\e[0m'    # No Color (Reset)


# ── GitHub Raw Link ───────────────────────────────────────────────────────
START_SH_URL="https://raw.githubusercontent.com/sahu-dev-hub/nath-scripts/refs/heads/main/start.sh"

# ── NATH SCRIPTS Banner ───────────────────────────────────────────────────
echo -e "${G}"
echo "  ███╗   ██╗ █████╗ ████████╗██╗  ██╗"
echo "  ████╗  ██║██╔══██╗╚══██╔══╝██║  ██║"
echo "  ██╔██╗ ██║███████║   ██║   ███████║"
echo "  ██║╚██╗██║██╔══██║   ██║   ██╔══██║"
echo "  ██║ ╚████║██║  ██║   ██║   ██║  ██║"
echo "  ╚═╝  ╚═══╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝"
echo ""
echo "  ███████╗ ██████╗██████╗ ██╗██████╗ ████████╗███████╗"
echo "  ██╔════╝██╔════╝██╔══██╗██║██╔══██╗╚══██╔══╝██╔════╝"
echo "  ███████╗██║     ██████╔╝██║██████╔╝   ██║   ███████╗"
echo "  ╚════██║██║     ██╔══██╗██║██╔═══╝    ██║   ╚════██║"
echo "  ███████║╚██████╗██║  ██║██║██║        ██║   ███████║"
echo "  ╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝        ╚═╝   ╚══════╝"
echo -e "${N}"
echo ""

# ── Shell Detection ───────────────────────────────────────────────────────
CURRENT_SHELL=$(basename "$SHELL")

if [ "$CURRENT_SHELL" = "zsh" ]; then
    RC_FILE="$HOME/.zshrc"
    echo -e "${GREEN}🐚 Default shell: ZSH detected → alias .zshrc me jayega${NC}"
elif [ "$CURRENT_SHELL" = "bash" ]; then
    RC_FILE="$HOME/.bashrc"
    echo -e "${GREEN}🐚 Default shell: BASH detected → alias .bashrc me jayega${NC}"
else
    # Fallback - agar koi aur shell hai
    RC_FILE="$HOME/.bashrc"
    echo -e "${GREEN}🐚 Shell detect nahi hua ($CURRENT_SHELL) → default .bashrc use karega${NC}"
fi

echo ""

# ── Step 1: ~/script folder banao ─────────────────────────────────────────
#echo -e "${GREEN}[1/4] Folder bana raha hai: ~/script${NC}"
mkdir -p ~/script

# ── Step 2: start.sh GitHub se download karo ──────────────────────────────
#echo -e "${GREEN}[2/4] start.sh download ho raha hai...${NC}"
wget -q "$START_SH_URL" -O ~/script/start.sh

if [ ! -f ~/script/start.sh ]; then
    echo "❌ Download fail hua! Internet check karo ya GitHub link check karo."
    exit 1
fi

# ── Step 3: Executable banao ───────────────────────────────────────────────
#echo -e "${GREEN}[3/4] start.sh ko executable bana raha hai...${NC}"
chmod +x ~/script/start.sh

# ── Step 4: Shortcut name lo aur alias banao ──────────────────────────────
echo ""
echo -e "${C}[4/4] Apna Koi Bhi Shortcut Name Type Karo... (Jo Aapko Accha Lage):${NC}"
read SHORTCUT

# Alias RC file me add karo
echo "" >> "$RC_FILE"
echo "# Ubuntu XFCE Desktop Shortcut" >> "$RC_FILE"
echo "alias $SHORTCUT='bash ~/script/start.sh'" >> "$RC_FILE"

rm -rf setup.sh


# RC file reload karo
source "$RC_FILE" 2>/dev/null || true


# ── Done! ─────────────────────────────────────────────────────────────────
echo ""
echo -e "${P}==============================${N}"
echo -e "${G} ✅ Setup complete ho gaya!  ${N}"
echo -e "${P}==============================${N}"
echo ""
echo -e "${G}Ab sirf '${SHORTCUT}' type karo — desktop start ho jayega! 🚀${N}"
echo -e "${C}(Agar abhi nahi chal raha to ek baar 'source ${RC_FILE}' chalaao)${N}"
echo -e "${Y}Or Ek Baar Termux Ko Restart Kar Lo 'CTRL+D Ya exit Type Kar Ke'${N}"

