class Mux < Formula
  desc "The official Mux CLI"
  homepage "https://github.com/muxinc/cli"
  version "2.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/muxinc/cli/releases/download/v2.0.1/mux-darwin-arm64"
      sha256 "40c6bbcfc74f0ff401ed6ba571c7684c8510cc952f5e355b29b12989bc45f999"
    else
      url "https://github.com/muxinc/cli/releases/download/v2.0.1/mux-darwin-x64"
      sha256 "db9a891d3d7585a76298efd32d44831d103ff5ec589128838ce54748c4a55ac3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/muxinc/cli/releases/download/v2.0.1/mux-linux-arm64"
      sha256 "1a0234fc0419615d5664eed255649c56619931b46dd0bb03fe7b440dfddea29d"
    else
      url "https://github.com/muxinc/cli/releases/download/v2.0.1/mux-linux-x64"
      sha256 "5efa150bee114914e64975b1abb466dd904f56e2036b5a9896a248cace31f98e"
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
