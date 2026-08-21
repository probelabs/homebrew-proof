class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260821133221"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260821133221/proof_0.1.0-main.20260821133221_darwin_arm64.tar.gz"
      sha256 "7362a4c7f7dbdfe39f0b236659c11f3e732a0fdf0af0b5542ccfa8b3982d73d7"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260821133221/proof_0.1.0-main.20260821133221_darwin_amd64.tar.gz"
      sha256 "a32165865d44210d5358d582550e7c6b9711cd337784116284c35c761560503c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260821133221/proof_0.1.0-main.20260821133221_linux_arm64.tar.gz"
      sha256 "1cac4dd17e6e9c578f4329d1b7a5ca54c7924d4e71c3902ce795793384268dae"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260821133221/proof_0.1.0-main.20260821133221_linux_amd64.tar.gz"
      sha256 "f8c1084285f767d146620eeb875e44360e0fe9918d85196b51006bf76093a755"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260821133221", output
  end
end
