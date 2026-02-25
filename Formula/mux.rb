class Mux < Formula
  desc "The official Mux CLI"
  homepage "https://github.com/muxinc/cli"
  version "1.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/muxinc/cli/releases/download/v1.0.1/mux-darwin-arm64"
      sha256 "b6b865763068e5dd8c64a63682abe19fc7d5da7aef5e93106f06a813f7d7891f"
    else
      url "https://github.com/muxinc/cli/releases/download/v1.0.1/mux-darwin-x64"
      sha256 "d177ba7cd64ba4cc0a32e5aa2f95d6d84110a4141c7eba32ebf1f091044b2cce"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/muxinc/cli/releases/download/v1.0.1/mux-linux-arm64"
      sha256 "617b51696a7b5967629914f030244266beccb1a843ba545725d7628e7c2ac085"
    else
      url "https://github.com/muxinc/cli/releases/download/v1.0.1/mux-linux-x64"
      sha256 "30cf51ad5bae9e47c709eb8cbb4476c9d933ecc1c74592a2067bf79cc9a3269a"
    end
  end

  def install
    binary = Dir.glob("mux-*").first || "mux"
    bin.install binary => "mux"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mux --version")
  end
end
