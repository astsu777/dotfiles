# Autogenerated config.py
#
# NOTE: config.py is intended for advanced users who are comfortable
# with manually migrating the config file on qutebrowser upgrades. If
# you prefer, you can also configure qutebrowser using the
# :set/:bind/:config-* commands without having to write a config.py
# file.
#
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Change the argument to True to still load settings configured via autoconfig.yml
config.load_autoconfig(False)

# When to show a changelog after qutebrowser was upgraded.
# Type: String
# Valid values:
#   - major: Show changelog for major upgrades (e.g. v2.0.0 -> v3.0.0).
#   - minor: Show changelog for major and minor upgrades (e.g. v2.0.0 -> v2.1.0).
#   - patch: Show changelog for major, minor and patch upgrades (e.g. v2.0.0 -> v2.0.1).
#   - never: Never show changelog after upgrades.
c.changelog_after_upgrade = 'minor'

# Automatically start playing `<video>` elements.
# Type: Bool
c.content.autoplay = False

# Allow websites to read canvas elements. Note this is needed for some
# websites to work properly.
# Type: Bool
c.content.canvas_reading = False

# Which cookies to accept. With QtWebEngine, this setting also controls
# other features with tracking capabilities similar to those of cookies;
# including IndexedDB, DOM storage, filesystem API, service workers, and
# AppCache. Note that with QtWebKit, only `all` and `never` are
# supported as per-domain values. Setting `no-3rdparty` or `no-
# unknown-3rdparty` per-domain on QtWebKit will have the same effect as
# `all`. If this setting is used with URL patterns, the pattern gets
# applied to the origin/first party URL of the page making the request,
# not the request URL. With QtWebEngine 5.15.0+, paths will be stripped
# from URLs, so URL patterns using paths will not match. With
# QtWebEngine 5.15.2+, subdomains are additionally stripped as well, so
# you will typically need to set this setting for `example.com` when the
# cookie is set on `somesubdomain.example.com` for it to work properly.
# To debug issues with this setting, start qutebrowser with `--debug
# --logfilter network --debug-flag log-cookies` which will show all
# cookies being set.
# Type: String
# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
c.content.cookies.accept = 'no-3rdparty'

# Which cookies to accept. With QtWebEngine, this setting also controls
# other features with tracking capabilities similar to those of cookies;
# including IndexedDB, DOM storage, filesystem API, service workers, and
# AppCache. Note that with QtWebKit, only `all` and `never` are
# supported as per-domain values. Setting `no-3rdparty` or `no-
# unknown-3rdparty` per-domain on QtWebKit will have the same effect as
# `all`. If this setting is used with URL patterns, the pattern gets
# applied to the origin/first party URL of the page making the request,
# not the request URL. With QtWebEngine 5.15.0+, paths will be stripped
# from URLs, so URL patterns using paths will not match. With
# QtWebEngine 5.15.2+, subdomains are additionally stripped as well, so
# you will typically need to set this setting for `example.com` when the
# cookie is set on `somesubdomain.example.com` for it to work properly.
# To debug issues with this setting, start qutebrowser with `--debug
# --logfilter network --debug-flag log-cookies` which will show all
# cookies being set.
# Type: String
# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')

# Which cookies to accept. With QtWebEngine, this setting also controls
# other features with tracking capabilities similar to those of cookies;
# including IndexedDB, DOM storage, filesystem API, service workers, and
# AppCache. Note that with QtWebKit, only `all` and `never` are
# supported as per-domain values. Setting `no-3rdparty` or `no-
# unknown-3rdparty` per-domain on QtWebKit will have the same effect as
# `all`. If this setting is used with URL patterns, the pattern gets
# applied to the origin/first party URL of the page making the request,
# not the request URL. With QtWebEngine 5.15.0+, paths will be stripped
# from URLs, so URL patterns using paths will not match. With
# QtWebEngine 5.15.2+, subdomains are additionally stripped as well, so
# you will typically need to set this setting for `example.com` when the
# cookie is set on `somesubdomain.example.com` for it to work properly.
# To debug issues with this setting, start qutebrowser with `--debug
# --logfilter network --debug-flag log-cookies` which will show all
# cookies being set.
# Type: String
# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
config.set('content.cookies.accept', 'all', 'devtools://*')

# Value to send in the `Accept-Language` header. Note that the value
# read from JavaScript is always the global value.
# Type: String
config.set('content.headers.accept_language', '', 'https://matchmaker.krunker.io/*')

# Custom headers for qutebrowser HTTP requests.
# Type: Dict
c.content.headers.custom = {'accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'}

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
c.content.headers.user_agent = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36'

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version} Edg/{upstream_browser_version}', 'https://accounts.google.com/*')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')

# Load images automatically in web pages.
# Type: Bool
config.set('content.images', True, 'chrome-devtools://*')

# Load images automatically in web pages.
# Type: Bool
config.set('content.images', True, 'devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome-devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

# Allow websites to show notifications.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
c.content.notifications.enabled = False

# Allow pdf.js to view PDF files in the browser. Note that the files can
# still be downloaded by clicking the download button in the pdf.js
# viewer.
# Type: Bool
c.content.pdfjs = True

# Open new windows in private browsing mode which does not record
# visited pages.
# Type: Bool
c.content.private_browsing = True

# Enable WebGL.
# Type: Bool
c.content.webgl = False

# Which interfaces to expose via WebRTC.
# Type: String
# Valid values:
#   - all-interfaces: WebRTC has the right to enumerate all interfaces and bind them to discover public interfaces.
#   - default-public-and-private-interfaces: WebRTC should only use the default route used by http. This also exposes the associated default private address. Default route is the route chosen by the OS on a multi-homed endpoint.
#   - default-public-interface-only: WebRTC should only use the default route used by http. This doesn't expose any local addresses.
#   - disable-non-proxied-udp: WebRTC should only use TCP to contact peers or servers unless the proxy server supports UDP. This doesn't expose any local addresses either.
c.content.webrtc_ip_handling_policy = 'default-public-interface-only'

# Directory to save downloads to. If unset, a sensible OS-specific
# default is used.
# Type: Directory
c.downloads.location.directory = '$HOME/Downloads'

# Where to show the downloaded files.
# Type: VerticalPosition
# Valid values:
#   - top
#   - bottom
c.downloads.position = 'bottom'

# Duration (in milliseconds) to wait before removing finished downloads.
# If set to -1, downloads are never removed.
# Type: Int
c.downloads.remove_finished = 1000

# Command (and arguments) to use for selecting a single file in forms.
# The command should write the selected file path to the specified file
# or stdout. The following placeholders are defined: * `{}`: Filename of
# the file to be written to. If not contained in any argument, the
# standard output of the command is read instead.
# Type: ShellCommand
c.fileselect.single_file.command = ['$TERMINAL', '-e', 'nnn', '-p', '{}']

# Command (and arguments) to use for selecting multiple files in forms.
# The command should write the selected file paths to the specified file
# or to stdout, separated by newlines. The following placeholders are
# defined: * `{}`: Filename of the file to be written to. If not
# contained in any argument, the   standard output of the command is
# read instead.
# Type: ShellCommand
c.fileselect.multiple_files.command = ['$TERMINAL', '-e', 'nnn', '-p', '{}']

# Command (and arguments) to use for selecting a single folder in forms.
# The command should write the selected folder path to the specified
# file or stdout. The following placeholders are defined: * `{}`:
# Filename of the file to be written to. If not contained in any
# argument, the   standard output of the command is read instead.
# Type: ShellCommand
c.fileselect.folder.command = ['$TERMINAL', '-e', 'nnn', '-p', '{}']

# Make characters in hint strings uppercase.
# Type: Bool
c.hints.uppercase = True

# Automatically enter insert mode if an editable element is focused
# after loading the page.
# Type: Bool
c.input.insert_mode.auto_load = True

# When/how to show the scrollbar.
# Type: String
# Valid values:
#   - always: Always show the scrollbar.
#   - never: Never show the scrollbar.
#   - when-searching: Show the scrollbar when searching for text in the webpage. With the QtWebKit backend, this is equal to `never`.
#   - overlay: Show an overlay scrollbar. On macOS, this is unavailable and equal to `when-searching`; with the QtWebKit backend, this is equal to `never`. Enabling/disabling overlay scrollbars requires a restart.
c.scrolling.bar = 'never'

# Enable smooth scrolling for web pages. Note smooth scrolling does not
# work with the `:scroll-px` command.
# Type: Bool
c.scrolling.smooth = True

# When to show the statusbar.
# Type: String
# Valid values:
#   - always: Always show the statusbar.
#   - never: Always hide the statusbar.
#   - in-mode: Show the statusbar when in modes other than normal mode.
c.statusbar.show = 'in-mode'

# Padding (in pixels) for the statusbar.
# Type: Padding
c.statusbar.padding = {'bottom': 3, 'left': 0, 'right': 0, 'top': 5}

# List of widgets displayed in the statusbar. In addition to the listed
# values there is also the possibility to add `text:foo` widgets that
# will display `foo`.
# Type: List of StatusbarWidget
# Valid values:
#   - url: Current page URL.
#   - scroll: Percentage of the current page position like `10%`.
#   - scroll_raw: Raw percentage of the current page position like `10`.
#   - history: Display an arrow when possible to go back/forward in history.
#   - tabs: Current active tab, e.g. `2`.
#   - keypress: Display pressed keys when composing a vi command.
#   - progress: Progress bar for the current page loading.
c.statusbar.widgets = ['keypress', 'url', 'scroll', 'tabs', 'progress']

# When to show favicons in the tab bar. When switching this from never
# to always/pinned, note that favicons might not be loaded yet, thus
# tabs might require a reload to display them.
# Type: String
# Valid values:
#   - always: Always show favicons.
#   - never: Always hide favicons.
#   - pinned: Show favicons only on pinned tabs.
c.tabs.favicons.show = 'never'

# How to behave when the last tab is closed. If the
# `tabs.tabs_are_windows` setting is set, this is ignored and the
# behavior is always identical to the `close` value.
# Type: String
# Valid values:
#   - ignore: Don't do anything.
#   - blank: Load a blank page.
#   - startpage: Load the start page.
#   - default-page: Load the default page.
#   - close: Close the window.
c.tabs.last_close = 'close'

# Switch between tabs using the mouse wheel.
# Type: Bool
c.tabs.mousewheel_switching = False

# Padding (in pixels) around text for tabs.
# Type: Padding
c.tabs.padding = {'bottom': 0, 'left': 5, 'right': 5, 'top': 4}

# Which tab to select when the focused tab is removed.
# Type: SelectOnRemove
# Valid values:
#   - prev: Select the tab which came before the closed one (left in horizontal, above in vertical).
#   - next: Select the tab which came after the closed one (right in horizontal, below in vertical).
#   - last-used: Select the previously selected tab.
c.tabs.select_on_remove = 'last-used'

# When to show the tab bar.
# Type: String
# Valid values:
#   - always: Always show the tab bar.
#   - never: Always hide the tab bar.
#   - multiple: Hide the tab bar if only one tab is open.
#   - switching: Show the tab bar when switching tabs.
c.tabs.show = 'multiple'

# Alignment of the text inside of tabs.
# Type: TextAlignment
# Valid values:
#   - left
#   - right
#   - center
c.tabs.title.alignment = 'left'

# Width (in pixels or as percentage of the window) of the tab bar if
# it's vertical.
# Type: PercOrInt
c.tabs.width = '15%'

# Width (in pixels) of the progress indicator (0 to disable).
# Type: Int
c.tabs.indicator.width = 2

# Padding (in pixels) for tab indicators.
# Type: Padding
c.tabs.indicator.padding = {'bottom': 2, 'left': 0, 'right': 4, 'top': 2}

# Page to open if :open -t/-b/-w is used without URL. Use `about:blank`
# for a blank page.
# Type: FuzzyUrl
c.url.default_page = 'about:blank'

# Search engines which can be used via the address bar.  Maps a search
# engine name (such as `DEFAULT`, or `ddg`) to a URL with a `{}`
# placeholder. The placeholder will be replaced by the search term, use
# `{{` and `}}` for literal `{`/`}` braces.  The following further
# placeholds are defined to configure how special characters in the
# search terms are replaced by safe characters (called 'quoting'):  *
# `{}` and `{semiquoted}` quote everything except slashes; this is the
# most   sensible choice for almost all search engines (for the search
# term   `slash/and&amp` this placeholder expands to `slash/and%26amp`).
# * `{quoted}` quotes all characters (for `slash/and&amp` this
# placeholder   expands to `slash%2Fand%26amp`). * `{unquoted}` quotes
# nothing (for `slash/and&amp` this placeholder   expands to
# `slash/and&amp`). * `{0}` means the same as `{}`, but can be used
# multiple times.  The search engine named `DEFAULT` is used when
# `url.auto_search` is turned on and something else than a URL was
# entered to be opened. Other search engines can be used by prepending
# the search engine name to the search term, e.g. `:open google
# qutebrowser`.
# Type: Dict
c.url.searchengines = {'DEFAULT': 'https://duckduckgo.com/?q={}&key=156e688cb0dde7e4558a853154db4b02f5b831c07f124ef90c48c6c0e372e4f4e0299c4073d0de7199994a409a65c5d6ab999b4c7105085dd6a0e653f4430b95'}

# Page(s) to open at the start.
# Type: List of FuzzyUrl, or FuzzyUrl
c.url.start_pages = 'about:blank'

# Hide the window decoration.  This setting requires a restart on
# Wayland.
# Type: Bool
c.window.hide_decoration = True

# Background color of the statusbar.
# Type: QssColor
c.colors.statusbar.normal.bg = '#282c34'

# Background color of the statusbar in insert mode.
# Type: QssColor
c.colors.statusbar.insert.bg = '#282c34'

# Background color of the statusbar in passthrough mode.
# Type: QssColor
c.colors.statusbar.passthrough.bg = '#282c34'

# Foreground color of the statusbar in command mode.
# Type: QssColor
c.colors.statusbar.command.fg = '#b294bb'

# Background color of the statusbar in command mode.
# Type: QssColor
c.colors.statusbar.command.bg = '#282c34'

# Foreground color of the statusbar in private browsing + command mode.
# Type: QssColor
c.colors.statusbar.command.private.fg = '#b294bb'

# Background color of the statusbar in private browsing + command mode.
# Type: QssColor
c.colors.statusbar.command.private.bg = '#282c34'

# Foreground color of the statusbar in caret mode.
# Type: QssColor
c.colors.statusbar.caret.fg = 'white'

# Background color of the statusbar in caret mode.
# Type: QssColor
c.colors.statusbar.caret.bg = '#282c34'

# Background color of the statusbar in caret mode with a selection.
# Type: QssColor
c.colors.statusbar.caret.selection.bg = '#282c34'

# Default foreground color of the URL in the statusbar.
# Type: QssColor
c.colors.statusbar.url.fg = 'orange'

# Foreground color of the URL in the statusbar on successful load
# (http).
# Type: QssColor
c.colors.statusbar.url.success.http.fg = '#81bd68'

# Foreground color of the URL in the statusbar on successful load
# (https).
# Type: QssColor
c.colors.statusbar.url.success.https.fg = '#81bd68'

# Background color of the tab bar.
# Type: QssColor
c.colors.tabs.bar.bg = '#282c34'

# Color for the tab indicator on errors.
# Type: QtColor
c.colors.tabs.indicator.error = 'red'

# Foreground color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.fg = 'darkgray'

# Background color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.bg = '#1c1c1c'

# Foreground color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.fg = 'darkgray'

# Background color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.bg = '#1c1c1c'

# Foreground color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.fg = 'black'

# Background color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.bg = '#e68a00'

# Foreground color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.fg = 'black'

# Background color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.bg = '#e68a00'

# Background color of pinned unselected odd tabs.
# Type: QtColor
c.colors.tabs.pinned.odd.bg = 'darkblue'

# Background color of pinned unselected even tabs.
# Type: QtColor
c.colors.tabs.pinned.even.bg = 'darkblue'

# Render all web contents using a dark theme. Example configurations
# from Chromium's `chrome://flags`:  - "With simple HSL/CIELAB/RGB-based
# inversion": Set   `colors.webpage.darkmode.algorithm` accordingly.  -
# "With selective image inversion": Set
# `colors.webpage.darkmode.policy.images` to `smart`.  - "With selective
# inversion of non-image elements": Set
# `colors.webpage.darkmode.threshold.text` to 150 and
# `colors.webpage.darkmode.threshold.background` to 205.  - "With
# selective inversion of everything": Combines the two variants   above.
# Type: Bool
c.colors.webpage.darkmode.enabled = False

#=======================
# Adblock
#=======================
c.content.blocking.enabled = True
c.content.blocking.method = 'auto'

c.content.blocking.adblock.lists = [
    'https://easylist.to/easylist/easylist.txt',
    'https://easylist.to/easylist/easyprivacy.txt',
    'https://raw.githubusercontent.com/AdguardTeam/FiltersRegistry/master/filters/filter_2_English/filter.txt',
    'https://raw.githubusercontent.com/AdguardTeam/FiltersRegistry/master/filters/filter_11_Mobile/filter.txt',
    'https://raw.githubusercontent.com/AdguardTeam/FiltersRegistry/master/filters/filter_16_French/filter.txt',
    'https://raw.githubusercontent.com/AdguardTeam/FiltersRegistry/master/filters/filter_8_Dutch/filter.txt',
    'https://secure.fanboy.co.nz/fanboy-annoyance.txt',
    'https://www.fanboy.co.nz/fanboy-antifacebook.txt',
    'https://secure.fanboy.co.nz/fanboy-cookiemonster.txt'
]

c.content.blocking.hosts.lists = [
    'https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts',
    'https://pgl.yoyo.org/adservers/serverlist.php?showintro=0;hostformat=hosts',
    'https://someonewhocares.org/hosts/zero/hosts',
    'https://blocklistproject.github.io/Lists/abuse.txt',
    'https://blocklistproject.github.io/Lists/fraud.txt',
    'https://blocklistproject.github.io/Lists/malware.txt',
    'https://blocklistproject.github.io/Lists/phishing.txt',
    'https://blocklistproject.github.io/Lists/ransomware.txt',
    'https://blocklistproject.github.io/Lists/scam.txt',
    'https://blocklistproject.github.io/Lists/tracking.txt'
]

c.content.blocking.whitelist = []


#=======================
# Keybindings
#=======================
# Media manipulation
config.bind('xv', 'hint links spawn tspool mpv --cache=yes --no-border --force-window --autofit=352x240 --geometry=-15-15 --really-quiet --title="mpv floating" {hint-url}')
config.bind('xV', 'hint links spawn tspool mpv --cache=yes --really-quiet --no-video {hint-url}')
config.bind('xd', 'hint links spawn tspool youtube-dl -ci --add-metadata --embed-thumbnail --embed-subs -f 299+bestaudio/137+bestaudio/best {hint-url} -o "$HOME"/Downloads/"%(uploader)s-%(upload_date)s-%(title)s-%(id)s.%(ext)s"')
config.bind('xD', 'hint links spawn tspool youtube-dl -ci --add-metadata --extract-audio --audio-format mp3 --audio-quality 0 {hint-url} -o "$HOME"/Downloads/"%(uploader)s-%(upload_date)s-%(title)s-%(id)s.%(ext)s"')
# Browsing experience
config.bind('xj', 'config-cycle -p content.javascript.enabled ;; reload')
config.bind('xi', 'config-cycle -p content.images ;; reload')
config.bind('xc', 'config-cycle -p content.blocking.enabled ;; reload')
# Web browser interface
config.bind('xb', 'config-cycle -p statusbar.show always never ;; config-cycle -p tabs.show always never')
