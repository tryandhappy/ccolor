Name:           ccolor
Version:        %{pkg_ver}
Release:        1%{?dist}
Summary:        Command to color text in the Bash prompt.

License:        MIT
BuildArch:      noarch
Requires:       bash, awk

Source0:        ccolor

%description
Command to color text in the Bash prompt.

%prep
# nothing

%build
# no build

%install
install -Dm0755 %{SOURCE0} %{buildroot}/usr/bin/ccolor

%files
/usr/bin/ccolor

%changelog
* 月  2月 23 2026 tryandhappy <tryandhappy@users.noreply.github.com> - 0.2.0-1
- Allow the background color to be specified.
- Add support for the -i option. Case insencitive.
- Default options.


* 月  2月 23 2026 tryandhappy <tryandhappy@users.noreply.github.com> - 0.1.2-1
- Fixed a bug where patterns containing ? or * in a regular expression tried to highlight zero-length matches.


* 月  2月 23 2026 tryandhappy <tryandhappy@users.noreply.github.com> - 0.1.1-1
- Automatically select colors, excluding yellow.

* 月  2月 23 2026 tryandhappy <tryandhappy@users.noreply.github.com> - 0.1.0-1
- Nightly.
