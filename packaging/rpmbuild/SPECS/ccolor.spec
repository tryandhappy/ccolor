Name:           ccolor
Version:        0.1.0
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
* Mon Feb 23 2026 tryandhappy <tryandhappy@users.noreply.github.com> - 0.1.0-1
- Nightly.
