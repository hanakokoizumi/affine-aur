# Maintainer: Hanako <i@hanako.me>
pkgname=affine-bin
pkgver=0.26.2
pkgrel=1
pkgdesc="A next-gen knowledge base that brings planning, sorting and creating all together"
arch=('x86_64')
url="https://affine.pro/"
license=('MIT' 'LicenseRef-custom')
depends=(
  'alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'glib2'
  'gtk3' 'libcups' 'libx11' 'libxcb' 'libxcomposite'
  'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr'
  'mesa' 'nspr' 'nss' 'pango'
)
provides=('affine')
conflicts=('affine')

_pkgname_deb="affine-${pkgver}-stable-linux-x64.deb"
source=(
    "${_pkgname_deb}::https://github.com/toeverything/AFFiNE/releases/download/v${pkgver}/${_pkgname_deb}"
    "LICENSE::https://raw.githubusercontent.com/toeverything/AFFiNE/v${pkgver}/LICENSE"
    "LICENSE-MIT::https://raw.githubusercontent.com/toeverything/AFFiNE/v${pkgver}/LICENSE-MIT"
)

sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
  tar -xf "${srcdir}/data.tar."* -C "${pkgdir}"

  chown -R root:root "${pkgdir}/"

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 "${pkgdir}/usr/lib/affine/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"

  # install -d "${pkgdir}/usr/bin"
  # ln -sf /opt/AFFiNE/affine "${pkgdir}/usr/bin/affine"
}
