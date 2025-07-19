class EldrinTunnel < Formula
  desc "SSH tunnel client for exposing local services to the internet"
  homepage "https://eldrin.link"
  version "0.0.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/eldrin-project/homebrew-eldrin-tunnel/releases/download/v0.0.4/eldrin-tunnel-x86_64-apple-darwin.tar.gz"
      sha256 "f9f06389939d6227dce2a8d2d549af5b1a83b2afa046c2529254f784ced5d1d7"
    end
    if Hardware::CPU.arm?
      url "https://github.com/eldrin-project/homebrew-eldrin-tunnel/releases/download/v0.0.4/eldrin-tunnel-aarch64-apple-darwin.tar.gz"
      sha256 "4048cc5127713d4c2d811fa2bd40436734f614cf85641688bc33c0d9ccada438"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/eldrin-project/homebrew-eldrin-tunnel/releases/download/v0.0.4/eldrin-tunnel-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "656b140c9b946617c14d8498a9adc039b80722267015284a360e2fbbb44c5ce9"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.intel?
        bin.install "eldrin-tunnel-x86_64-apple-darwin" => "eldrin-tunnel"
      elsif Hardware::CPU.arm?
        bin.install "eldrin-tunnel-aarch64-apple-darwin" => "eldrin-tunnel"
      end
    elsif OS.linux?
      bin.install "eldrin-tunnel-x86_64-unknown-linux-gnu" => "eldrin-tunnel"
    end
  end

  test do
    output = shell_output("#{bin}/eldrin-tunnel --help")
    assert_match "Cross-platform SSH tunnel client", output
  end

  def caveats
    <<~EOS
      Welcome to Eldrin Tunnel! 🚇

      Quick start:
        eldrin-tunnel --port 3000

      Login and create tunnel:
        eldrin-tunnel --login user@example.com
        eldrin-tunnel --port 3000

      Static URL (registered users):
        eldrin-tunnel --port 3000 --url myapp

      Visit https://eldrin.link for documentation.
      
      Install via: brew tap eldrin-project/eldrin-tunnel
    EOS
  end
end