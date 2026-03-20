# ============================================================
#  qutebrowser config.py
#  Theme: base16 Black Metal (custom)
#  Focus: Vim keys · Privacy · Clean UI · Google search
# ============================================================
# Drop into: ~/.config/qutebrowser/config.py
# Reload:    :config-source
# ============================================================

config.load_autoconfig(False)

# ── Palette ──────────────────────────────────────────────────
# Mapped from your base16 setup:
#   base00 #000000  bg (darkest)
#   base01 #121212  bg alt / tab bar
#   base02 #222222  selection bg / line nr bg
#   base03 #333333  subtle borders
#   base04 #999999  muted fg
#   base05 #c1c1c1  main fg
#   base08 #5f8787  teal accent (URLs, hints)
#   base0A #8c7f70  warm tan
#   base0B #9b8d7f  beige — active tab / selection
#   err    #912222  your DiagnosticVirtualTextError

bg = "#000000"
bg_alt = "#121212"
bg_sel = "#222222"
border = "#333333"
fg_muted = "#999999"
fg_main = "#c1c1c1"
fg_dim = "#888888"
fg_sub = "#444444"
accent = "#9b8d7f"  # beige — active tab bg / selection
accent2 = "#8c7f70"  # warm tan
teal = "#5f8787"  # hints / URLs
err = "#912222"

# ── General ──────────────────────────────────────────────────

c.auto_save.session = True
c.session.lazy_restore = True
c.content.autoplay = False
c.content.notifications.enabled = False
c.content.geolocation = False
c.content.javascript.clipboard = "none"
c.scrolling.smooth = True
c.zoom.default = "100%"
c.statusbar.show = "in-mode"
# ── Privacy ──────────────────────────────────────────────────

c.content.cookies.accept = "no-3rdparty"
c.content.webrtc_ip_handling_policy = "default-public-interface-only"
c.content.canvas_reading = True
c.content.headers.do_not_track = False
c.content.headers.referer = "same-domain"
c.content.headers.custom = {"Accept-Language": "en-US,en;q=0.9"}
c.completion.height = "25%"

# ── Ad Blocking ──────────────────────────────────────────────
# Tip: pip install adblock  →  unlocks Brave's adblock engine

c.content.blocking.enabled = True
c.content.blocking.method = "both"
c.content.blocking.adblock.lists = [
    "https://easylist.to/easylist/easylist.txt",
    "https://easylist.to/easylist/easyprivacy.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/annoyances.txt",
    "https://secure.fanboy.com.au/fanboy-annoyance.txt",
]
c.content.blocking.hosts.lists = [
    "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts",
]

# ── Search & URLs ────────────────────────────────────────────

c.url.default_page = "https://www.google.com"
c.url.start_pages = ["https://www.google.com"]
c.url.searchengines = {
    "DEFAULT": "https://www.google.com/search?q={}",
    "!g": "https://www.google.com/search?q={}",
    "!gh": "https://github.com/search?q={}",
    "!yt": "https://www.youtube.com/results?search_query={}",
    "!r": "https://www.reddit.com/search/?q={}",
    "!maps": "https://www.google.com/maps/search/{}",
}

# ── Tabs ─────────────────────────────────────────────────────

c.tabs.show = "multiple"
c.tabs.last_close = "close"
c.tabs.mousewheel_switching = False
c.tabs.new_position.unrelated = "next"
c.tabs.title.format = "{audio}{current_title}"
c.tabs.padding = {"top": 5, "bottom": 5, "left": 10, "right": 10}

# ── Status bar ───────────────────────────────────────────────

c.statusbar.padding = {"top": 4, "bottom": 4, "left": 6, "right": 6}
c.statusbar.widgets = ["keypress", "url", "scroll", "history", "tabs", "progress"]
c.window.title_format = "{perc}{current_title}"

# ── Fonts ────────────────────────────────────────────────────

sz = "11pt"
ff = "monospace"

c.fonts.default_family = ff
c.fonts.default_size = sz
c.fonts.completion.entry = f"{sz} {ff}"
c.fonts.completion.category = f"bold {sz} {ff}"
c.fonts.statusbar = f"{sz} {ff}"
c.fonts.tabs.selected = f"{sz} {ff}"
c.fonts.tabs.unselected = f"{sz} {ff}"
c.fonts.hints = f"bold {sz} {ff}"

# ── Dark mode for web pages ──────────────────────────────────

c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.policy.images = "smart"
c.colors.webpage.preferred_color_scheme = "dark"
c.colors.webpage.bg = bg

# ── Per-site dark mode overrides ─────────────────────────────
config.set("colors.webpage.darkmode.enabled", False, "https://www.youtube.com/*")
config.set("colors.webpage.darkmode.enabled", False, "https://music.youtube.com/*")

# ── Tab colours ──────────────────────────────────────────────
# Active:   beige bg (#9b8d7f) + black text  ← inverted as requested
# Inactive: #121212 bg + muted grey text
# Note: qutebrowser only exposes odd/even variants, no bare selected/unselected

c.colors.tabs.bar.bg = bg_alt

c.colors.tabs.selected.odd.bg = accent
c.colors.tabs.selected.odd.fg = bg
c.colors.tabs.selected.even.bg = accent
c.colors.tabs.selected.even.fg = bg

c.colors.tabs.odd.bg = bg_alt
c.colors.tabs.odd.fg = fg_muted
c.colors.tabs.even.bg = bg_alt
c.colors.tabs.even.fg = fg_muted

c.colors.tabs.pinned.selected.odd.bg = accent2
c.colors.tabs.pinned.selected.odd.fg = bg
c.colors.tabs.pinned.selected.even.bg = accent2
c.colors.tabs.pinned.selected.even.fg = bg
c.colors.tabs.pinned.odd.bg = bg_alt
c.colors.tabs.pinned.odd.fg = fg_sub
c.colors.tabs.pinned.even.bg = bg_alt
c.colors.tabs.pinned.even.fg = fg_sub

c.colors.tabs.indicator.start = teal
c.colors.tabs.indicator.stop = accent
c.colors.tabs.indicator.error = err

# ── Completion dropdown ───────────────────────────────────────

c.colors.completion.fg = fg_main
c.colors.completion.odd.bg = bg
c.colors.completion.even.bg = bg_alt
c.colors.completion.category.fg = accent
c.colors.completion.category.bg = bg
c.colors.completion.category.border.top = bg
c.colors.completion.category.border.bottom = border
c.colors.completion.item.selected.fg = bg
c.colors.completion.item.selected.bg = accent
c.colors.completion.item.selected.border.top = accent
c.colors.completion.item.selected.border.bottom = accent
c.colors.completion.item.selected.match.fg = bg
c.colors.completion.match.fg = accent
c.colors.completion.scrollbar.fg = fg_sub
c.colors.completion.scrollbar.bg = bg

# ── Status bar colours ───────────────────────────────────────

c.colors.statusbar.normal.bg = bg
c.colors.statusbar.normal.fg = fg_muted
c.colors.statusbar.insert.bg = bg
c.colors.statusbar.insert.fg = accent
c.colors.statusbar.passthrough.bg = bg
c.colors.statusbar.passthrough.fg = teal
c.colors.statusbar.command.bg = bg
c.colors.statusbar.command.fg = fg_main
c.colors.statusbar.caret.bg = bg
c.colors.statusbar.caret.fg = accent
c.colors.statusbar.caret.selection.bg = bg_sel
c.colors.statusbar.caret.selection.fg = accent
c.colors.statusbar.progress.bg = accent
c.colors.statusbar.url.fg = fg_main
c.colors.statusbar.url.success.http.fg = fg_muted
c.colors.statusbar.url.success.https.fg = fg_main
c.colors.statusbar.url.error.fg = err
c.colors.statusbar.url.warn.fg = accent2
c.colors.statusbar.url.hover.fg = teal

# ── Hints ────────────────────────────────────────────────────

c.colors.hints.bg = accent
c.colors.hints.fg = bg
c.colors.hints.match.fg = bg_sel
c.hints.border = f"1px solid {bg}"
c.hints.radius = 2
c.hints.mode = "letter"
c.hints.chars = "asdfghjklqwertyuiopzxcvbnm"

# ── Downloads ────────────────────────────────────────────────

c.colors.downloads.bar.bg = bg
c.colors.downloads.start.bg = bg_sel
c.colors.downloads.start.fg = fg_main
c.colors.downloads.stop.bg = accent
c.colors.downloads.stop.fg = bg
c.colors.downloads.error.bg = err
c.colors.downloads.error.fg = fg_main

# ── Messages ─────────────────────────────────────────────────

c.colors.messages.error.bg = err
c.colors.messages.error.fg = fg_main
c.colors.messages.error.border = err
c.colors.messages.warning.bg = accent2
c.colors.messages.warning.fg = bg
c.colors.messages.warning.border = accent2
c.colors.messages.info.bg = bg_alt
c.colors.messages.info.fg = fg_main
c.colors.messages.info.border = border

# ── Prompts ──────────────────────────────────────────────────

c.colors.prompts.bg = bg_alt
c.colors.prompts.fg = fg_main
c.colors.prompts.border = f"1px solid {border}"
c.colors.prompts.selected.bg = accent
c.colors.prompts.selected.fg = bg

# ── Context menu ─────────────────────────────────────────────

c.colors.contextmenu.menu.bg = bg_alt
c.colors.contextmenu.menu.fg = fg_main
c.colors.contextmenu.selected.bg = accent
c.colors.contextmenu.selected.fg = bg
c.colors.contextmenu.disabled.bg = bg_alt
c.colors.contextmenu.disabled.fg = fg_sub

# ── Keybindings ──────────────────────────────────────────────

# Tab navigation (feels like vim buffers)
config.bind("J", "tab-prev")
config.bind("K", "tab-next")
config.bind("H", "back")
config.bind("L", "forward")
config.bind("gT", "tab-prev")
config.bind("gt", "tab-next")

# Tab management
config.bind("X", "tab-close")
config.bind("u", "undo")  # reopen closed tab
config.bind("<Ctrl-t>", "open -t")
config.bind("<Ctrl-w>", "tab-close")

# Paste URL from clipboard
config.bind("pp", "open -- {clipboard}")
config.bind("pP", "open -t -- {clipboard}")

# Yank
config.bind("yY", "yank")

# Config shortcuts
config.bind(",c", "config-edit")
config.bind(",r", "config-source")

# Mute / zoom
config.bind("M", "tab-mute")
config.bind("+", "zoom-in")
config.bind("_", "zoom-out")

# search with
config.bind(",gh", "cmd-set-text :open -t !gh  ")
config.bind(",yt", "cmd-set-text :open -t !yt  ")
config.bind(",rd", "cmd-set-text :open -t !r  ")
config.bind(",mp", "cmd-set-text :open -t !maps  ")
