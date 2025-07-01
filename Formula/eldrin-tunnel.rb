class EldrinTunnel < Formula
  desc "Secure WebSocket tunneling for exposing local services to the internet"
  homepage "https://tunnel.eldrin.io"
  version "0.0.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/eldrin-project/eldrin-tunnel-client/releases/download/v0.0.7/eldrin-tunnel-client-x86_64-apple-darwin.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    end
    if Hardware::CPU.arm?
      url "https://github.com/eldrin-project/eldrin-tunnel-client/releases/download/v0.0.7/eldrin-tunnel-client-aarch64-apple-darwin.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/eldrin-project/eldrin-tunnel-client/releases/download/v0.0.7/eldrin-tunnel-client-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.intel?
        bin.install "eldrin-tunnel-client-x86_64-apple-darwin" => "eldrin-tunnel"
      elsif Hardware::CPU.arm?
        bin.install "eldrin-tunnel-client-aarch64-apple-darwin" => "eldrin-tunnel"
      end
    elsif OS.linux?
      bin.install "eldrin-tunnel-client-x86_64-unknown-linux-gnu" => "eldrin-tunnel"
    end
  end

  test do
    output = shell_output("#{bin}/eldrin-tunnel --help")
    assert_match "Eldrin Tunnel Interactive CLI", output
  end

  def caveats
    <<~EOS
      Welcome to Eldrin Tunnel! 🚇

      Quick start:
        eldrin-tunnel ws://tunnel.eldrin.io:8080 3000 30

      Interactive mode:
        eldrin-tunnel

      Visit https://tunnel.eldrin.io for documentation and pricing.
      
      Installed via: brew tap eldrin-project/eldrin-tunnel

      🎉 Soft Launch Special: First 100 users get 5 free tunnels!
    EOS
  end
end
