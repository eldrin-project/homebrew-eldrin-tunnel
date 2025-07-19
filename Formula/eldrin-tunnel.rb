class EldrinTunnel < Formula
  desc "SSH tunnel client for exposing local services to the internet"
  homepage "https://tunnel.eldrin.link"
  version "0.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/eldrin-project/homebrew-eldrin-tunnel/releases/download/v0.0.2/eldrin-tunnel-x86_64-apple-darwin.tar.gz"
      sha256 "dee72a6e3c6a1a05834de70f53665d006ab9e966ba5f3ea14024612790c48c92"
    end
    if Hardware::CPU.arm?
      url "https://github.com/eldrin-project/homebrew-eldrin-tunnel/releases/download/v0.0.2/eldrin-tunnel-aarch64-apple-darwin.tar.gz"
      sha256 "a6b75901e2fe8b3c8490d1ab3287b1ef8f4ace98494972fb08bbbc5da1c5456f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/eldrin-project/homebrew-eldrin-tunnel/releases/download/v0.0.2/eldrin-tunnel-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b49d6ac8e8d3f8aacb99ced3c73c079fe4ad924f7b4cebb1de82d533e61d04e5"
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
