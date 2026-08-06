class Mux < Formula
  desc "The official Mux CLI"
  homepage "https://github.com/muxinc/cli"
  version "2.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/muxinc/cli/releases/download/v2.0.0/mux-darwin-arm64"
      sha256 "20b418287c28d2986bdc8650a1dd996dcfe6c91bad94e492e6f059121bf6d404"
    else
      url "https://github.com/muxinc/cli/releases/download/v2.0.0/mux-darwin-x64"
      sha256 "1721e8f2de3ce8dc15fe89650dc395a10824ec119ce2d236818b31b6a0e47654"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/muxinc/cli/releases/download/v2.0.0/mux-linux-arm64"
      sha256 "b276a7a4814853a8d782647b2c9fbc911cf0a8a40379092b06fb9da0726441df"
    else
      url "https://github.com/muxinc/cli/releases/download/v2.0.0/mux-linux-x64"
      sha256 "3e752d8abac3ff991588a051aa7f6955c3ec0d40b144dbe31de5a06e005da020"
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
