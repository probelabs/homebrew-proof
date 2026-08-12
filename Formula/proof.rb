class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260812103636"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260812103636/proof_0.1.0-main.20260812103636_darwin_arm64.tar.gz"
      sha256 "d3767d26dd0475da4607d1c69e4a443db530aa000a7b1bdd1e511c46fc4ad30d"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260812103636/proof_0.1.0-main.20260812103636_darwin_amd64.tar.gz"
      sha256 "de7bf7ee834d5be3c600ba732f13a3ddde419956f75ab2aeb9a3c3d925f4b9b0"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260812103636/proof_0.1.0-main.20260812103636_linux_arm64.tar.gz"
      sha256 "a86e877d8207ab4de8be601c36d2f8a3e288b135ed731bf74fbb7790709418a3"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260812103636/proof_0.1.0-main.20260812103636_linux_amd64.tar.gz"
      sha256 "a864524268edc0a7236ac0ed558a9ff4fe82040139be5be83ac2bb65e2ddb757"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260812103636", output
  end
end
