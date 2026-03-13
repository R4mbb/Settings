#!/usr/bin/env bash
set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
NVIM_CONFIG="$HOME/.config/nvim"
TMUX_CONF="$HOME/.tmux.conf"
BACKUP_DIR="$HOME/.dotfiles-backup-$(date +%Y%m%d_%H%M%S)"

# ── 색상 ──────────────────────────────────────────────────────────────────────
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; BOLD='\033[1m'; NC='\033[0m'
info()    { echo -e "${BOLD}[INFO]${NC}  $*"; }
success() { echo -e "${GREEN}[OK]${NC}    $*"; }
warn()    { echo -e "${YELLOW}[WARN]${NC}  $*"; }
error()   { echo -e "${RED}[ERROR]${NC} $*"; exit 1; }

# ── 의존성 확인 ───────────────────────────────────────────────────────────────
check_deps() {
  info "의존성 확인 중..."
  local missing=()

  command -v nvim &>/dev/null || missing+=("neovim")
  command -v tmux &>/dev/null || missing+=("tmux")
  command -v git  &>/dev/null || missing+=("git")
  command -v zsh  &>/dev/null || warn "zsh 없음 — zsh 설정을 적용하려면 설치 필요"
  command -v rg   &>/dev/null || warn "ripgrep(rg) 없음 — Telescope grep 기능 제한됨"
  command -v fd   &>/dev/null || warn "fd 없음 — Telescope 파일 검색 속도 저하 가능"
  command -v node &>/dev/null || warn "node 없음 — 일부 LSP 서버 설치 불가"

  if [[ ${#missing[@]} -gt 0 ]]; then
    error "필수 도구가 없습니다: ${missing[*]}"
  fi

  success "의존성 확인 완료"
}

# ── tmux 설정 ─────────────────────────────────────────────────────────────────
install_tmux() {
  info "tmux 설정 적용 중..."
  local src="$REPO_DIR/tmux/.tmux.conf"

  if [[ ! -f "$src" ]]; then
    warn "tmux/.tmux.conf 없음. 건너뜁니다."
    return
  fi

  if [[ -f "$TMUX_CONF" && ! -L "$TMUX_CONF" ]]; then
    mkdir -p "$BACKUP_DIR"
    cp "$TMUX_CONF" "$BACKUP_DIR/.tmux.conf"
    warn "기존 ~/.tmux.conf 백업: $BACKUP_DIR/.tmux.conf"
  fi

  ln -sf "$src" "$TMUX_CONF"
  success "심볼릭 링크: $TMUX_CONF -> $src"

  if tmux info &>/dev/null 2>&1; then
    tmux source-file "$TMUX_CONF"
    success "tmux 설정 리로드 완료"
  fi
}

# ── nvim 설정 ─────────────────────────────────────────────────────────────────
install_nvim() {
  info "nvim 설정 적용 중..."
  local src="$REPO_DIR/nvim"

  if [[ ! -d "$src" ]]; then
    warn "nvim/ 디렉토리 없음. 건너뜁니다."
    return
  fi

  if [[ -d "$NVIM_CONFIG" && ! -L "$NVIM_CONFIG" ]]; then
    mkdir -p "$BACKUP_DIR"
    mv "$NVIM_CONFIG" "$BACKUP_DIR/nvim"
    warn "기존 nvim 설정 백업: $BACKUP_DIR/nvim"
  elif [[ -L "$NVIM_CONFIG" ]]; then
    rm "$NVIM_CONFIG"
  fi

  mkdir -p "$HOME/.config"
  ln -sf "$src" "$NVIM_CONFIG"
  success "심볼릭 링크: $NVIM_CONFIG -> $src"
}

# ── 완료 ──────────────────────────────────────────────────────────────────────
print_done() {
  echo ""
  echo -e "${GREEN}${BOLD}설치 완료!${NC}"
  echo ""
  echo "  1. nvim 을 실행하면 플러그인이 자동으로 설치됩니다."
  echo "  2. 터미널에 Nerd Font 를 설정해야 아이콘이 정상 표시됩니다."
  echo "  3. zsh 설정은 README.md 의 가이드를 참고하세요."
  echo ""
}

# ── main ──────────────────────────────────────────────────────────────────────
usage() {
  echo "사용법: $0 [옵션]"
  echo ""
  echo "  (옵션 없음)   tmux + nvim 전체 설치"
  echo "  --tmux-only   tmux 설정만 적용"
  echo "  --nvim-only   nvim 설정만 적용"
  echo "  --help        이 메시지 출력"
}

main() {
  echo ""
  echo -e "${BOLD}dotfiles installer — zsh + tmux + LazyVim${NC}"
  echo "──────────────────────────────────────────"
  echo ""

  case "${1:-}" in
    --tmux-only) check_deps; install_tmux ;;
    --nvim-only)  check_deps; install_nvim  ;;
    --help)       usage; exit 0 ;;
    "")           check_deps; install_tmux; install_nvim ;;
    *)            error "알 수 없는 옵션: $1" ;;
  esac

  print_done
}

main "$@"
