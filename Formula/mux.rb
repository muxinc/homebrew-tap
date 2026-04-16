class Mux < Formula
  desc "The official Mux CLI"
  homepage "https://github.com/muxinc/cli"
  version "1.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/muxinc/cli/releases/download/v1.3.2/mux-darwin-arm64"
      sha256 "be255ecf03709355eadd115ba127f6cb6927ba5179fe57f0b92b33c985d00f20"
    else
      url "https://github.com/muxinc/cli/releases/download/v1.3.2/mux-darwin-x64"
      sha256 "66ac98303086f7727f1065c59b1bd0163f3213c612e474bc9b68e926cabfdbe1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/muxinc/cli/releases/download/v1.3.2/mux-linux-arm64"
      sha256 "37f785a86824491ec5cd26581faf981fb29fb3cfc61143cf6365c1d3bb20f4c1"
    else
      url "https://github.com/muxinc/cli/releases/download/v1.3.2/mux-linux-x64"
      sha256 "3bd6c264a076c7249678004a480bbc7eec00a5bf7eabdf76eef311e9e2e0b6b8"
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
