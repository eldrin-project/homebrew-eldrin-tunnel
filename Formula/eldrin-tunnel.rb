class EldrinTunnel < Formula
  desc "SSH tunnel client for exposing local services to the internet"
  homepage "https://tunnel.eldrin.link"
  version "0.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/eldrin-project/eldrin-tunnel/releases/download/v0.0.1/eldrin-tunnel-x86_64-apple-darwin.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    end
    if Hardware::CPU.arm?
      url "https://github.com/eldrin-project/eldrin-tunnel/releases/download/v0.0.1/eldrin-tunnel-aarch64-apple-darwin.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/eldrin-project/eldrin-tunnel/releases/download/v0.0.1/eldrin-tunnel-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
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

      Visit https://tunnel.eldrin.link for documentation.
      
      Install via: brew tap eldrin-project/eldrin-tunnel
    EOS
  end
end
