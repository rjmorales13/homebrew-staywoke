class Staywoke < Formula
  desc "Keep your Mac awake only while AI agents are working"
  homepage "https://github.com/rjmorales13/staywoke"
  version "1.0.6"
  license "MIT"

  depends_on macos: :sonoma

  on_arm do
    url "https://github.com/rjmorales13/staywoke/releases/download/v1.0.6/staywoke-v1.0.6-arm64.tar.gz"
    sha256 "add928cc10dde793529d41a63dbac77060f3ca8d5abfc86f4b144ee0954e2943"
  end

  on_intel do
    url "https://github.com/rjmorales13/staywoke/releases/download/v1.0.6/staywoke-v1.0.6-x86_64.tar.gz"
    sha256 "c49882a9c02a2f4e4c8bd069575db3c55ced1e3c8507954d4cc17a7312d000d9"
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
