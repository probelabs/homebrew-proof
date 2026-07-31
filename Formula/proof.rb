class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260731070025"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260731070025/proof_0.1.0-main.20260731070025_darwin_arm64.tar.gz"
      sha256 "4b6d291bedf59a54b8d63aed91d637f3c15fd284dba847efeb6253a09aaeeda9"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260731070025/proof_0.1.0-main.20260731070025_darwin_amd64.tar.gz"
      sha256 "129b3ef6b99140a8b1e0711ec170f8514dae67939a5af764758f96c93bb26ca0"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260731070025/proof_0.1.0-main.20260731070025_linux_arm64.tar.gz"
      sha256 "b2c500090ae55f77f79345db68035006c5298df40f75a5071808a8d0d510ebb3"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260731070025/proof_0.1.0-main.20260731070025_linux_amd64.tar.gz"
      sha256 "bb1bb3e3d3dc6cad0fe66dfb5d98a21b71ef2b6a12bb606a3f12789fd43bf178"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260731070025", output
  end
end
