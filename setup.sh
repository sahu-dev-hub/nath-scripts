#!/data/data/com.termux/files/usr/bin/bash

# ── Colors ────────────────────────────────────────────────────────────────
GREEN='\033[0;32m'
NC='\033[0m'

# ── GitHub Raw Link ───────────────────────────────────────────────────────
START_SH_URL="https://raw.githubusercontent.com/sahu-dev-hub/shortcus-scrips/main/start.sh"

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
echo -e "${GREEN}[4/4] Apna Koi Bhi Shortcut Name Type Karo (Jo Aap Ko Accha Lage) :${NC}"
read SHORTCUT

# Alias ~/.zshrc me add karo
echo "" >> ~/.zshrc
echo "# Ubuntu XFCE Desktop Shortcut" >> ~/.zshrc
echo "alias $SHORTCUT='bash ~/script/start.sh'" >> ~/.zshrc

# zshrc reload karo
source ~/.zshrc 2>/dev/null || true

# ── Done! ─────────────────────────────────────────────────────────────────
echo ""
echo -e "${GREEN}==============================${NC}"
echo -e "${GREEN} ✅ Setup complete ho gaya!  ${NC}"
echo -e "${GREEN}==============================${NC}"
echo ""
echo -e "${GREEN}Ab sirf '${SHORTCUT}' type karo — desktop start ho jayega! 🚀${NC}"
echo -e "${GREEN}(Agar abhi nahi chal raha to ek baar 'source ~/.zshrc' chalaao)${NC}"
