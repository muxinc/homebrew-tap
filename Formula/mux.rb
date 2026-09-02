class Mux < Formula
  desc "The official Mux CLI"
  homepage "https://github.com/muxinc/cli"
  version "2.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/muxinc/cli/releases/download/v2.1.0/mux-darwin-arm64"
      sha256 "bd06234230f5d586b946619b2636c74355356dcde99428fb95d6bdc8d3c4d5a3"
    else
      url "https://github.com/muxinc/cli/releases/download/v2.1.0/mux-darwin-x64"
      sha256 "e354d2617f625b846e039a94cdcc59f89245c1215fb7221f938fbb18ca433151"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/muxinc/cli/releases/download/v2.1.0/mux-linux-arm64"
      sha256 "f0a734ca6241470e69cd07b7103f5f111ff3e686f987ab3803873453748f0497"
    else
      url "https://github.com/muxinc/cli/releases/download/v2.1.0/mux-linux-x64"
      sha256 "5761e15bc4cc0a4533084b6c1a7aef8c3347b60ce1f29bb0f02ed9d38c9305f9"
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
