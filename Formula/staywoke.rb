class Staywoke < Formula
  desc "Keep your Mac awake only while AI agents are working"
  homepage "https://github.com/rjmorales13/staywoke"
  version "1.0.7"
  license "MIT"

  depends_on macos: :sonoma

  on_arm do
    url "https://github.com/rjmorales13/staywoke/releases/download/v1.0.7/staywoke-v1.0.7-arm64.tar.gz"
    sha256 "f9191b5c29b7c9204cda3d6aeaf25971b48b5b87bc2d235c243c6cb2f20dfbac"
  end

  on_intel do
    url "https://github.com/rjmorales13/staywoke/releases/download/v1.0.7/staywoke-v1.0.7-x86_64.tar.gz"
    sha256 "614cfc6556ef6583054d8335ec7d9c60b53eb9285b02e24f25a88459e5f45081"
  end

  def install
    bin.install "staywoke", "com.rjmorales.6ix9ine.daemon", "com.rjmorales.6ix9ine.helper"
    prefix.install "com.rjmorales.6ix9ine.helper.plist"
    man1.install "man/staywoke.1"
  end

  def caveats
    <<~EOS
      Finish installation or an upgrade from 6ix9ine with:

        staywoke setup-privileged-helper
        staywoke daemon-restart
        staywoke install-hooks --all

      Open the dashboard with staywoke or staywoke dashboard.
    EOS
  end

  test do
    assert_match "Stay Woke v#{version}", shell_output("#{bin}/staywoke --version")
    assert_match "usage: staywoke dashboard", shell_output("#{bin}/staywoke dashboard --help")
    refute_path_exists bin/"6ix9ine"
    refute_path_exists bin/"t69"
  end
end
