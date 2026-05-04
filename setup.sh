#!/data/data/com.termux/files/usr/bin/bash

# ── Colors ────────────────────────────────────────────────────────────────
GREEN='\033[0;32m'
NC='\033[0m'

# ── GitHub Raw Link ───────────────────────────────────────────────────────
START_SH_URL="https://raw.githubusercontent.com/sahu-dev-hub/nath-scripts/refs/heads/main/start.sh"

# ── NATH SCRIPTS Banner ───────────────────────────────────────────────────
echo -e "${GREEN}"
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
echo -e "${NC}"
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
echo -e "${GREEN}[4/4] Apna Koi Bhi Shortcut Name Type Karo (Jo Aapko Accha Lage):${NC}"
read SHORTCUT

# Alias RC file me add karo
echo "" >> "$RC_FILE"
echo "# Ubuntu XFCE Desktop Shortcut" >> "$RC_FILE"
echo "alias $SHORTCUT='bash ~/script/start.sh'" >> "$RC_FILE"

# RC file reload karo
source "$RC_FILE" 2>/dev/null || true

source ${RC_FILE}

rm -rf setup.sh


# ── Done! ─────────────────────────────────────────────────────────────────
echo ""
echo -e "${GREEN}==============================${NC}"
echo -e "${GREEN} ✅ Setup complete ho gaya!  ${NC}"
echo -e "${GREEN}==============================${NC}"
echo ""
echo -e "${GREEN}Ab sirf '${SHORTCUT}' type karo — desktop start ho jayega! 🚀${NC}"
echo -e "${GREEN}(Agar abhi nahi chal raha to ek baar 'source ${RC_FILE}' chalaao)${NC}"
