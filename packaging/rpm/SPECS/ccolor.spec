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
* Tue Mar 17 2026 tryandhappy - 0.3.2-1
- Bump version to 0.3.2 and reorganize packaging layout.

* Tue Mar 10 2026 tryandhappy - 0.3.1-1
- Update the packaging directory layout.

* Sat Mar 07 2026 tryandhappy - 0.3.0-1
- Handle arguments with complex patterns.
- - Changed so that \- can be escaped.

* Mon Feb 23 2026 tryandhappy - 0.2.0-1
- Allow the background color to be specified.
- Add support for the -i option. Case insencitive.
- Default options.


* Mon Feb 23 2026 tryandhappy - 0.1.2-1
- Fixed a bug where patterns containing ? or * in a regular expression tried to highlight zero-length matches.


* Mon Feb 23 2026 tryandhappy - 0.1.1-1
- Automatically select colors, excluding yellow.

* Mon Feb 23 2026 tryandhappy - 0.1.0-1
- Nightly.
