class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260805145750"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260805145750/proof_0.1.0-main.20260805145750_darwin_arm64.tar.gz"
      sha256 "cd305a33d6ff3b555f9cc9172cc26eac28dbf76ec212ce70ec59189411b2d18b"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260805145750/proof_0.1.0-main.20260805145750_darwin_amd64.tar.gz"
      sha256 "abd8380f7d3eae105f8841e394444582886f76e3d919e049059ca3b746111f3b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260805145750/proof_0.1.0-main.20260805145750_linux_arm64.tar.gz"
      sha256 "949c6ceb30b5dc7ccfa6405a1ddfb608828612741111e157661a690fb7504c45"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260805145750/proof_0.1.0-main.20260805145750_linux_amd64.tar.gz"
      sha256 "2260259031f056fb0b56072c34ca0bee043e2baef49e3cd7c8bcd42ddb27abf3"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260805145750", output
  end
end
