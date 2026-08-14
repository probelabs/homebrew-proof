class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260814100443"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260814100443/proof_0.1.0-main.20260814100443_darwin_arm64.tar.gz"
      sha256 "9663029e67c84167fb65cf433500f91d242af768a71dbede4ecf6ddcc3bed99a"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260814100443/proof_0.1.0-main.20260814100443_darwin_amd64.tar.gz"
      sha256 "ce1e2c4bf094bde278c21ce36f13573ccd3d90b4a413c86d6a58c38f3f389209"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260814100443/proof_0.1.0-main.20260814100443_linux_arm64.tar.gz"
      sha256 "d40ac996ed32bf393a4c0fdcf6991e8f54ba6f2aeb8ef9a98c2b5c8a3a3dcb43"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260814100443/proof_0.1.0-main.20260814100443_linux_amd64.tar.gz"
      sha256 "e8ab7e1334c0e13711098772d489149c21987bd16f5283e238ff69ac429d7a05"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260814100443", output
  end
end
