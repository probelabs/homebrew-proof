class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260812181857"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260812181857/proof_0.1.0-main.20260812181857_darwin_arm64.tar.gz"
      sha256 "d8cd27baddc1a4464d8cf69b77248aebd98bd882aa120f863b9559aebb05a809"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260812181857/proof_0.1.0-main.20260812181857_darwin_amd64.tar.gz"
      sha256 "9401374c74b4a70def0626da814d5c87032a862bbe701ba05c39bfb8c94d8a29"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260812181857/proof_0.1.0-main.20260812181857_linux_arm64.tar.gz"
      sha256 "efc0e8ba16f966a580383fa04cb5b0fc85675af5f6787f409c8160ebed8fc9cf"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260812181857/proof_0.1.0-main.20260812181857_linux_amd64.tar.gz"
      sha256 "ceffff113d39c3881d1ee9a82c3cf2b8a1b3ba0eb87f494ac0db8cfe302a4b7b"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260812181857", output
  end
end
