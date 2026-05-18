class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260518041353"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260518041353/proof_0.1.0-main.20260518041353_darwin_arm64.tar.gz"
      sha256 "014e24fc02c120b566aa855916b312b7b8d66b0e46039b07af901b9bf65de819"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260518041353/proof_0.1.0-main.20260518041353_darwin_amd64.tar.gz"
      sha256 "d7bacbdf92a48bcc9fd3de32703e75d3e27eb51bdb8678743f48162676a2a325"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260518041353/proof_0.1.0-main.20260518041353_linux_arm64.tar.gz"
      sha256 "32056b3fe1bedcc7ff655d713a43d02dc9ddec28fbb5d3bbb336501fa313e93b"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260518041353/proof_0.1.0-main.20260518041353_linux_amd64.tar.gz"
      sha256 "89261941aa0722447aabb03c8b253522645c9d4b73c42211b4a0ce1dc980f820"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260518041353", output
  end
end
