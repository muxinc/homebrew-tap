class Mux < Formula
  desc "The official Mux CLI"
  homepage "https://github.com/muxinc/cli"
  version "1.0.0-beta.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/muxinc/cli/releases/download/v1.0.0-beta.7/mux-darwin-arm64"
      sha256 "62c206a05a1480efe52d0cac26eb7799860113dbfc6576defd0bfac16ab07007"
    else
      url "https://github.com/muxinc/cli/releases/download/v1.0.0-beta.7/mux-darwin-x64"
      sha256 "bd0eca63ee73f98b60472be9649704ebf5e2a118a908f58570ca59c055baafdb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/muxinc/cli/releases/download/v1.0.0-beta.7/mux-linux-arm64"
      sha256 "ee8ccf60b8a7e7c6f5d20f4f621722df104e6158b391a6a7e52460127d9ff424"
    else
      url "https://github.com/muxinc/cli/releases/download/v1.0.0-beta.7/mux-linux-x64"
      sha256 "9f218ec0b8a06304555f3e1aa464df8fb3686ad0e2fc1a5890cb8213a2bc93a9"
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
