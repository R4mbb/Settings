# dotfiles — zsh + tmux + LazyVim

개인 개발 환경 설정 모음. `install.sh` 한 번으로 다른 PC에서 동일 환경을 구축할 수 있습니다.

---

## 목차

- [요구사항](#요구사항)
- [설치](#설치)
- [zsh 설정](#zsh-설정)
- [tmux 설정 및 단축키](#tmux-설정-및-단축키)
- [Neovim (LazyVim) 단축키](#neovim-lazyvim-단축키)
- [설정 파일 구조](#설정-파일-구조)

---

## 요구사항

| 도구 | 최소 버전 | 용도 |
|------|-----------|------|
| Neovim | 0.9+ | 에디터 |
| tmux | 3.0+ | 터미널 멀티플렉서 |
| zsh | 5.x | 셸 |
| git | 2.x | 버전 관리 |
| [Nerd Font](https://www.nerdfonts.com/) | — | 아이콘 표시 |
| `ripgrep` | — | nvim 텍스트 검색 |
| `fd` | — | nvim 파일 검색 |
| `node` | 12+ | LSP 서버 |

---

## 설치

```bash
git clone https://github.com/R4mbb/Settings.git ~/.dotfiles
cd ~/.dotfiles
bash install.sh
```

| 옵션 | 동작 |
|------|------|
| `bash install.sh` | tmux + nvim 전체 설치 |
| `bash install.sh --tmux-only` | tmux 설정만 적용 |
| `bash install.sh --nvim-only` | nvim 설정만 적용 |

> 기존 `~/.tmux.conf`, `~/.config/nvim` 은 날짜가 붙은 백업 디렉토리로 자동 이동됩니다.

설치 후 nvim을 실행하면 플러그인이 자동 설치됩니다.

---

## zsh 설정

### 설치

```bash
# zsh 설치
sudo apt install zsh

# 기본 셸 변경
chsh -s $(which zsh)

# Oh My Zsh 설치
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

### 플러그인

```bash
# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

`~/.zshrc` 의 `plugins` 항목 수정:

```bash
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)
```

### 테마 — Powerlevel10k

```bash
git clone https://github.com/romkatv/powerlevel10k.git \
  $ZSH_CUSTOM/themes/powerlevel10k

sudo apt install fonts-powerline
```

`~/.zshrc` 에서 테마 변경:

```bash
ZSH_THEME="powerlevel10k/powerlevel10k"
```

```bash
source ~/.zshrc
p10k configure
```

---

## tmux 설정 및 단축키

prefix: `C-a` (Ctrl + a)

### 세션 / 윈도우

| 단축키 | 동작 |
|--------|------|
| `C-a c` | 새 윈도우 |
| `C-a t` / `C-a T` | 다음 / 이전 윈도우 |
| `C-a space` | 다음 윈도우 |
| `C-a R` | tmux.conf 리로드 |
| `C-a r` | 화면 새로고침 |

### 패널

| 단축키 | 동작 |
|--------|------|
| `C-a v` | 수직 분할 (좌우) |
| `C-a s` | 수평 분할 (상하) |
| `C-a q` | 패널 번호 표시 |
| `C-a a` | 이전 패널로 |
| `C-a +` | main-horizontal 레이아웃 |
| `C-a =` | main-vertical 레이아웃 |

### 패널 이동 — nvim 통합

nvim 안에서든 tmux 패널에서든 동일한 키로 이동합니다.

| 단축키 | 동작 |
|--------|------|
| `C-h` | 왼쪽 |
| `C-j` | 아래 |
| `C-k` | 위 |
| `C-l` | 오른쪽 |
| `C-\` | 이전 패널 |

### 복사 모드 (vi 키)

| 단축키 | 동작 |
|--------|------|
| `C-a [` | 복사 모드 진입 |
| `v` | 선택 시작 |
| `y` | 복사 |
| `C-a ]` | 붙여넣기 |

---

## Neovim (LazyVim) 단축키

leader: `Space`

### 파일 탐색

| 단축키 | 동작 |
|--------|------|
| `<leader>ff` | 파일 이름으로 찾기 |
| `<leader>fg` | 내용 전체 검색 (grep) |
| `<leader>fb` | 열린 버퍼 목록 |
| `<leader>fr` | 최근 파일 |
| `<leader>e` | 파일 트리 (Neo-tree) |

### 버퍼

| 단축키 | 동작 |
|--------|------|
| `<S-h>` / `<S-l>` | 이전 / 다음 버퍼 |
| `<leader>bd` | 현재 버퍼 닫기 |
| `<leader>bD` | 다른 버퍼 모두 닫기 |

### 창 분할

| 단축키 | 동작 |
|--------|------|
| `<leader>-` | 수평 분할 |
| `<leader>\|` | 수직 분할 |
| `<leader>wd` | 현재 창 닫기 |
| `<leader>wm` | 창 최대화 토글 |

### LSP / 코드

| 단축키 | 동작 |
|--------|------|
| `gd` | 정의로 이동 |
| `gr` | 참조 목록 |
| `K` | 호버 문서 |
| `<leader>ca` | 코드 액션 |
| `<leader>cr` | 심볼 rename |
| `<leader>cf` | 포맷 |
| `<leader>cd` | 현재 줄 오류 설명 |
| `[d` / `]d` | 이전 / 다음 진단 |
| `<leader>xx` | 진단 목록 (Trouble) |

### 검색

| 단축키 | 동작 |
|--------|------|
| `/` | 검색 (결과 수 표시) |
| `n` / `N` | 다음 / 이전 결과 |
| `<leader>sr` | 프로젝트 전체 찾기/바꾸기 |

### Git

| 단축키 | 동작 |
|--------|------|
| `<leader>gg` | Lazygit |
| `<leader>gd` | Diff 보기 |
| `<leader>gb` | Git blame |
| `]h` / `[h` | 다음 / 이전 hunk |
| `<leader>ghs` | Hunk stage |
| `<leader>ghp` | Hunk 미리보기 |

### 터미널

| 단축키 | 동작 |
|--------|------|
| `<leader>ft` | 터미널 열기 (float) |
| `<C-/>` | 터미널 토글 |

### Harpoon2 — 파일 북마크

| 단축키 | 동작 |
|--------|------|
| `<leader>ha` | 현재 파일 추가 |
| `<leader>hh` | 북마크 목록 |
| `<leader>1` ~ `<leader>4` | 1~4번 파일로 이동 |

### vim-visual-multi — 다중 커서

| 단축키 | 동작 |
|--------|------|
| `C-n` | 커서 단어 선택 + 다음 동일 단어 추가 |
| `q` | 현재 커서 건너뜀 |
| `<Esc>` | 다중 커서 종료 |

### 자동 적용 기능

| 플러그인 | 동작 |
|----------|------|
| nvim-colorizer | `#fff`, `rgb()` 색상 코드 배경 미리보기 |
| vim-illuminate | 커서 단어와 동일한 단어 자동 강조 |
| rainbow-delimiters | 괄호 깊이별 색상 구분 |
| treesitter-context | 현재 함수/클래스 이름 상단 고정 |
| nvim-hlslens | 검색 결과 수 표시 |

---

## 설정 파일 구조

```
Settings/
├── README.md
├── install.sh
├── nvim/                       # ~/.config/nvim 으로 링크
│   ├── init.lua
│   ├── lazyvim.json
│   ├── lazy-lock.json
│   ├── stylua.toml
│   └── lua/
│       ├── config/
│       │   ├── lazy.lua        # lazy.nvim 부트스트랩
│       │   ├── options.lua     # 에디터 옵션 (termguicolors 등)
│       │   ├── keymaps.lua     # 커스텀 키맵
│       │   └── autocmds.lua
│       └── plugins/
│           ├── tmux.lua        # vim-tmux-navigator
│           └── editor.lua      # harpoon2, colorizer 등
└── tmux/
    └── .tmux.conf              # ~/.tmux.conf 로 링크
```

---

## 업데이트

```bash
# nvim 플러그인 업데이트
:Lazy update

# 설정 변경 후 반영
cd ~/.dotfiles
git add -A && git commit -m "update config"
git push
```
