class EldrinTunnel < Formula
  desc "SSH tunnel client for exposing local services to the internet"
  homepage "https://tunnel.eldrin.link"
  version "0.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/eldrin-project/homebrew-eldrin-tunnel/releases/download/v0.0.3/eldrin-tunnel-x86_64-apple-darwin.tar.gz"
      sha256 "25a6763ca03fcb22088145cae33b081b995adcd4e333cca37e5868f2bf279d5c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/eldrin-project/homebrew-eldrin-tunnel/releases/download/v0.0.3/eldrin-tunnel-aarch64-apple-darwin.tar.gz"
      sha256 "e1f39f33710ff633cca5e7149d477b96662f1d23ddd4da91665d0647237816e3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/eldrin-project/homebrew-eldrin-tunnel/releases/download/v0.0.3/eldrin-tunnel-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fb37d216ca6f6a316852a9bc09773430e50f0fe522f34cd4a4c0d26d1a276bf9"
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