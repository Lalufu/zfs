AC_DEFUN([ZFS_AC_CONFIG_USER_SYSTEMD], [
	AC_ARG_ENABLE(systemd,
		AC_HELP_STRING([--enable-systemd],
		[install systemd unit/preset files [[default: yes]]]),
		[],enable_systemd=yes)

	AC_ARG_WITH(systemdunitdir,
		AC_HELP_STRING([--with-systemdunitdir=DIR],
		[install systemd unit files in dir [[EPREFIX/lib/systemd/system]]]),
		systemdunitdir=$withval,systemdunitdir=/usr/lib/systemd/system)

	AC_ARG_WITH(systemdpresetdir,
		AC_HELP_STRING([--with-systemdpresetdir=DIR],
		[install systemd preset files in dir [[EPREFIX/lib/systemd/system-preset]]]),
		systemdpresetdir=$withval,systemdpresetdir=/usr/lib/systemd/system-preset)

	AS_IF([test "x$enable_systemd" = xyes],
		[ZFS_INIT_SYSTEMD=systemd])

	AC_SUBST(ZFS_INIT_SYSTEMD)
	AC_SUBST(systemdunitdir)
	AC_SUBST(systemdpresetdir)
])
