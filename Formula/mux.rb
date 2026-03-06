class Mux < Formula
  desc "The official Mux CLI"
  homepage "https://github.com/muxinc/cli"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/muxinc/cli/releases/download/v1.1.0/mux-darwin-arm64"
      sha256 "a6901c9b1cea1407f8af66c02c3fb41a0a482157ef4dca89c01dc4de2322eb3c"
    else
      url "https://github.com/muxinc/cli/releases/download/v1.1.0/mux-darwin-x64"
      sha256 "e3fbf861e44da88a294bbbfe86bed1275b9b2ef3849a2948898afeec19623016"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/muxinc/cli/releases/download/v1.1.0/mux-linux-arm64"
      sha256 "a1beb7cc2d2c09e7a86f5fd6e31297e51f79eccad5201293a61e8af381dcc10c"
    else
      url "https://github.com/muxinc/cli/releases/download/v1.1.0/mux-linux-x64"
      sha256 "92c9e0f07222ec010b2ebc1603421b40fc1cbf7cc1ab34b3501769336d30bc90"
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
