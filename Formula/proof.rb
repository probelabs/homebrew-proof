class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260817081339"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817081339/proof_0.1.0-main.20260817081339_darwin_arm64.tar.gz"
      sha256 "0dca61ef43dd3c774f8a8fd7494dfd4ae913ff4170eac6450989b271998c0cc1"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817081339/proof_0.1.0-main.20260817081339_darwin_amd64.tar.gz"
      sha256 "87707b4f6423c3d05fc8be236946f3383bbf8809e9226c5c5e2ed181c7e7a97c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817081339/proof_0.1.0-main.20260817081339_linux_arm64.tar.gz"
      sha256 "ad6cac508f03f47fe1e5e17d2580a275ebdae641bf095568c5a76344a8fda713"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817081339/proof_0.1.0-main.20260817081339_linux_amd64.tar.gz"
      sha256 "6160c4fdb3f7e0b3090382e016d048480b4039786c26396524876759ab0c6b82"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260817081339", output
  end
end
