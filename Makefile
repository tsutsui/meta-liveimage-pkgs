# $NetBSD$
#

REVISION=	20210331
DISTNAME=	liveimage-pkgs-${REVISION}
CATEGORIES=	meta-pkgs
MASTER_SITES=	# empty
DISTFILES=	# empty

MAINTAINER=	tsutsui@NetBSD.org
COMMENT=	Meta-package to build binaries used in the teokure live image

META_PACKAGE=	yes

.include "../../mk/bsd.prefs.mk"

# shells
DEPENDS+=	bash-[0-9]*:../../shells/bash
DEPENDS+=	tcsh-[0-9]*:../../shells/tcsh
DEPENDS+=	zsh-[0-9]*:../../shells/zsh

# editors
DEPENDS+=	emacs-[0-9]*:../../editors/emacs
DEPENDS+=	medit-[0-9]*:../../editors/medit

# browser and plugin
# XXX pkgsrc use oss for firefox, but alsa is preferred for 7.x based liveimage
PKG_OPTIONS.firefox=	alsa dbus
DEPENDS+=	firefox-[0-9]*:../../www/firefox
DEPENDS+=	firefox-l10n-[0-9]*:../../www/firefox-l10n
DEPENDS+=	w3m-[0-9]*:../../www/w3m
.if (${OPSYS} == "NetBSD" && !empty(OS_VERSION:M[678].*))
# firefox is built with GCC_REQD=4.9 so explicitly prepare gcc6-libs too
DEPENDS+=	gcc6-libs-[0-9]*:../../lang/gcc6-libs
.endif
DEPENDS+=	alsa-utils-[0-9]*:../../audio/alsa-utils
DEPENDS+=	alsa-plugins-oss-[0-9]*:../../audio/alsa-plugins-oss
DEPENDS+=	alsa-plugins-pulse-[0-9]*:../../audio/alsa-plugins-pulse

# fonts
DEPENDS+=	vlgothic-ttf-[0-9]*:../../fonts/vlgothic-ttf
DEPENDS+=	ipafont-[0-9]*:../../fonts/ipafont
DEPENDS+=	droid-ttf-[0-9]*:../../fonts/droid-ttf
DEPENDS+=	efont-unicode-[0-9]*:../../fonts/efont-unicode
DEPENDS+=	freefont-ttf-[0-9]*:../../fonts/freefont-ttf
DEPENDS+=	unifont-[0-9]*:../../fonts/unifont
DEPENDS+=	jisx0212fonts-[0-9]*:../../fonts/jisx0212fonts
DEPENDS+=	jisx0213fonts-[0-9]*:../../fonts/jisx0213fonts
DEPENDS+=	twemoji-color-font-ttf-[0-9]*:../../fonts/twemoji-color-font-ttf

# window manager
DEPENDS+=	jwm-[0-9]*:../../wm/jwm
DEPENDS+=	wm-icons-[0-9]*:../../graphics/wm-icons

# Japanese input method
#  mozc
DEPENDS+=	mozc-server-[0-9]*:../../inputmethod/mozc-server
DEPENDS+=	mozc-tool-[0-9]*:../../inputmethod/mozc-tool
DEPENDS+=	mozc-elisp-[0-9]*:../../inputmethod/mozc-elisp

# ibus
DEPENDS+=	ibus-[0-9]*:../../inputmethod/ibus
DEPENDS+=	ibus-mozc-[0-9]*:../../inputmethod/ibus-mozc
# requred icons by gtk3+
DEPENDS+=	adwaita-icon-theme-[0-9]*:../../graphics/adwaita-icon-theme

# terminal emulators
DEPENDS+=	kterm-[0-9]*:../../x11/kterm
DEPENDS+=	mlterm-[0-9]*:../../x11/mlterm

# SNS clients
DEPENDS+=	${RUBY_PKGPREFIX}-mikutter-[0-9]*:../../net/mikutter
DEPENDS+=	${RUBY_PKGPREFIX}-mikutter-plugins-twitter-[0-9]*:../../net/mikutter-plugins-twitter
#DEPENDS+=	${RUBY_PKGPREFIX}-tw-[0-9]*:../../net/ruby-tw
DEPENDS+=	sayaka-[0-9]*:../../net/sayaka
DEPENDS+=	nanotodon-[0-9]*:../../net/nanotodon

# scm (for mikutter plugin github etc)
DEPENDS+=	git-base-[0-9]*:../../devel/git-base
DEPENDS+=	git-docs-[0-9]*:../../devel/git-docs
DEPENDS+=	mozilla-rootcerts-[0-9]*:../../security/mozilla-rootcerts

# tools
DEPENDS+=	arandr-[0-9]*:../../x11/arandr
DEPENDS+=	wpa_gui-[0-9]*:../../net/wpa_gui

# pkgin
#DEPENDS+=	pkgin-[0-9]*:../../pkgtools/pkgin

.include "../../lang/ruby/rubyversion.mk"
.include "../../mk/bsd.pkg.mk"
