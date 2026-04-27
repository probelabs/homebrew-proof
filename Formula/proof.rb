class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260427162716"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427162716/proof_0.1.0-main.20260427162716_darwin_arm64.tar.gz"
      sha256 "3bc854fed2d13f10b6c7fde291f0c25d04ca229e233db96f7094ae2d47f8f41c"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427162716/proof_0.1.0-main.20260427162716_darwin_amd64.tar.gz"
      sha256 "992f80dc8a9d24c4544af34698421e01ac6b55dcec27903749195e79b9307504"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427162716/proof_0.1.0-main.20260427162716_linux_arm64.tar.gz"
      sha256 "0adde5fe382a01fde8a641a8d3e77b95d762c39504af6a63adec959284c4ab3f"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427162716/proof_0.1.0-main.20260427162716_linux_amd64.tar.gz"
      sha256 "6d6726136e7da6212ded96bb8f33f76d5b1bfff61fa98ac6f9df334b4bedefb9"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260427162716", output
  end
end
