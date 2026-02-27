class Mux < Formula
  desc "The official Mux CLI"
  homepage "https://github.com/muxinc/cli"
  version "1.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/muxinc/cli/releases/download/v1.0.2/mux-darwin-arm64"
      sha256 "4ddc5be590c81a818a202bc776568d5b16996895d700ea9519f5ffe2413b97de"
    else
      url "https://github.com/muxinc/cli/releases/download/v1.0.2/mux-darwin-x64"
      sha256 "7a692c058c9d1ccc727b9366bb7a0603d2dac044d5f30f293a1846a17ee81e4f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/muxinc/cli/releases/download/v1.0.2/mux-linux-arm64"
      sha256 "f10ee56f95dcc2c8344ffa4899d8bb900a39b48201d10072de81812ddca877a2"
    else
      url "https://github.com/muxinc/cli/releases/download/v1.0.2/mux-linux-x64"
      sha256 "7d551276e0a25794f51268419abf65e09979aef19bb0a58f974640b1b3345cfa"
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
