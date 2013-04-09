# $NetBSD$
#

REVISION=	20130407
DISTNAME=	liveimage-pkgs-${REVISION}
CATEGORIES=	meta-pkgs
MASTER_SITES=	# empty
DISTFILES=	# empty

MAINTAINER=	tsutsui@NetBSD.org
COMMENT=	Meta-package to build binaries used in the teokure live image

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
DEPENDS+=	gnash-[0-9]*:../../multimedia/gnash

# fonts
DEPENDS+=	vlgothic-ttf-[0-9]*:../../fonts/vlgothic-ttf
DEPENDS+=	ipafont-[0-9]*:../../fonts/ipafont

# terminal emulators
DEPENDS+=	kterm-[0-9]*:../../x11/kterm
DEPENDS+=	mlterm-[0-9]*:../../x11/mlterm

# window manager
DEPENDS+=	jwm-[0-9]*:../../wm/jwm

# Japanese input method
#  ibus
DEPENDS+=	ibus-[0-9]*:../../inputmethod/ibus
#  mozc
DEPENDS+=	ibus-mozc-[0-9]*:../../inputmethod/ibus-mozc
DEPENDS+=	mozc-server-[0-9]*:../../inputmethod/mozc-server
DEPENDS+=	mozc-tool-[0-9]*:../../inputmethod/mozc-tool
DEPENDS+=	mozc-elisp-[0-9]*:../../inputmethod/mozc-elisp

# alsa (for mikutter notification voice)
DEPENDS+=	alsa-utils-[0-9]*:../../audio/alsa-utils
DEPENDS+=	alsa-plugins-oss-[0-9]*:../../audio/alsa-plugins-oss

# mikutter
DEPENDS+=	${RUBY_PKGPREFIX}-mikutter-[0-9]*:../../net/mikutter

# scm (for mikutter plugin github etc)
DEPENDS+=	scmgit-base-[0-9]*:../../devel/scmgit-base

# pkgin
#DEPENDS+=	pkgin-[0-9]*:../../pkgtools/pkgin

META_PACKAGE=	yes

.include "../../lang/ruby/rubyversion.mk"
.include "../../mk/bsd.pkg.mk"
