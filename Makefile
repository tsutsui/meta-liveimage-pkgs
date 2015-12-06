# $NetBSD$
#

REVISION=	20151228
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
DEPENDS+=	firefox-[0-9]*:../../www/firefox
DEPENDS+=	firefox-l10n-[0-9]*:../../www/firefox-l10n
#  H264 seems to require gst ffmpeg plugin
DEPENDS+=	gst-libav-[0-9]*:../../multimedia/gst-plugins1-libav
DEPENDS+=	gst-plugins1-good-[0-9]*:../../multimedia/gst-plugins1-good
DEPENDS+=	w3m-[0-9]*:../../www/w3m
# firefox is built with GCC_REQD=4.8 so explicitly prepare gcc48-libs too
.if (${OPSYS} == "NetBSD" && !empty(OS_VERSION:M6.*))
DEPENDS+=	gcc48-libs-[0-9]*:../../lang/gcc48-libs
.endif

# fonts
DEPENDS+=	vlgothic-ttf-[0-9]*:../../fonts/vlgothic-ttf
DEPENDS+=	ipafont-[0-9]*:../../fonts/ipafont
DEPENDS+=	droid-ttf-[0-9]*:../../fonts/droid-ttf
DEPENDS+=	efont-unicode-[0-9]*:../../fonts/efont-unicode
DEPENDS+=	freefont-ttf-[0-9]*:../../fonts/freefont-ttf
DEPENDS+=	unifont-[0-9]*:../../fonts/unifont

# window manager
DEPENDS+=	jwm-[0-9]*:../../wm/jwm

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

# twitter clients
DEPENDS+=	${RUBY_PKGPREFIX}-mikutter-[0-9]*:../../net/mikutter
DEPENDS+=	${RUBY_PKGPREFIX}-tw-[0-9]*:../../net/ruby-tw
DEPENDS+=	mozilla-rootcerts-[0-9]*:../../security/mozilla-rootcerts

# scm (for mikutter plugin github etc)
DEPENDS+=	git-base-[0-9]*:../../devel/git-base
DEPENDS+=	git-docs-[0-9]*:../../devel/git-docs

# pkgin
#DEPENDS+=	pkgin-[0-9]*:../../pkgtools/pkgin

.include "../../lang/ruby/rubyversion.mk"
.include "../../mk/bsd.pkg.mk"
