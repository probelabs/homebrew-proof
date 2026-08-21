class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260821113640"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260821113640/proof_0.1.0-main.20260821113640_darwin_arm64.tar.gz"
      sha256 "75888b456a5fdb3bb9c894d961c3cc4f3435852edcf30a9e15d3cdab5d21da32"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260821113640/proof_0.1.0-main.20260821113640_darwin_amd64.tar.gz"
      sha256 "35483dc55cb6789273004091491362165efc4b6d101fc0603a6998a5c318dd4f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260821113640/proof_0.1.0-main.20260821113640_linux_arm64.tar.gz"
      sha256 "68ca1da0ee68d0e61be4e8e1451f17bc5512933c858c31bb6f3ac8676232728f"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260821113640/proof_0.1.0-main.20260821113640_linux_amd64.tar.gz"
      sha256 "6e32fc30941bceda3cf0ac9aad9bfd04b365c2ef70be0d58e142d489400b812c"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260821113640", output
  end
end
