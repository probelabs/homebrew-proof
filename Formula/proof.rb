class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260814153155"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260814153155/proof_0.1.0-main.20260814153155_darwin_arm64.tar.gz"
      sha256 "0aedf0d3e7f1a729e8c3c9cb9e51d8647a6168fca0ee7271e8b9ac55da570972"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260814153155/proof_0.1.0-main.20260814153155_darwin_amd64.tar.gz"
      sha256 "253d520bd65a91c8f2b443c533b2ade65010f78b5814de6a15ed4dde029772d6"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260814153155/proof_0.1.0-main.20260814153155_linux_arm64.tar.gz"
      sha256 "ce638ec7345c0800295acad4172549b2c583c09827f13bcde22bbe3657dd3a31"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260814153155/proof_0.1.0-main.20260814153155_linux_amd64.tar.gz"
      sha256 "b679daa9e38bacc6360c61654e71f97dd4d4f080f3ab2d7c803f1951eab09118"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260814153155", output
  end
end
