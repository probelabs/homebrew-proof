class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260817090254"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817090254/proof_0.1.0-main.20260817090254_darwin_arm64.tar.gz"
      sha256 "f2d91ac0c45339faaa5df5eccd8cd585f1e36c8eb24dc6ca64be67565296e7b2"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817090254/proof_0.1.0-main.20260817090254_darwin_amd64.tar.gz"
      sha256 "54af3a71181dc59196585dfd4e62fd8862aa18662f6fe088e21008d44722fc7b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817090254/proof_0.1.0-main.20260817090254_linux_arm64.tar.gz"
      sha256 "eccc43509c1ceea78fed2684e330ee70d676422fbbc031c1ae2938b649e5d43c"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817090254/proof_0.1.0-main.20260817090254_linux_amd64.tar.gz"
      sha256 "eedd3e852bc24d77a538e9ac5054a62d0780f830d4bf96feb781c983469de084"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260817090254", output
  end
end
