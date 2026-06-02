class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260602142031"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260602142031/proof_0.1.0-main.20260602142031_darwin_arm64.tar.gz"
      sha256 "2e61415e0bce91bde8d7c44318e429346eb392173237946845ebef2dc2db4ab7"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260602142031/proof_0.1.0-main.20260602142031_darwin_amd64.tar.gz"
      sha256 "6daa937a3a6a4f2825c536ba034da860c9556fcc73c176044c17106a9cac952e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260602142031/proof_0.1.0-main.20260602142031_linux_arm64.tar.gz"
      sha256 "c8405c54ed25b61ee497c876ea6140275891c6f9b416dbc4aba7d166d6cab4f3"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260602142031/proof_0.1.0-main.20260602142031_linux_amd64.tar.gz"
      sha256 "432dd382689d4ac3e6dc638e338eed314d3190c2140ff748987daebcb0461fc9"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260602142031", output
  end
end
