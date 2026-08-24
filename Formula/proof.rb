class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260824084502"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260824084502/proof_0.1.0-main.20260824084502_darwin_arm64.tar.gz"
      sha256 "c8b36836f752fb03d43b3bdd4fb1d1d53dfbf5856e4a3d5367df40778d8b8043"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260824084502/proof_0.1.0-main.20260824084502_darwin_amd64.tar.gz"
      sha256 "4a848ddf2a640dfe3874955c97ca99bb54c620512a86f03b83c5a6c24d39a205"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260824084502/proof_0.1.0-main.20260824084502_linux_arm64.tar.gz"
      sha256 "9fca1cd2574fe08f9387a1ee84f33a882b1da6c40cccb579763fc53c40f29225"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260824084502/proof_0.1.0-main.20260824084502_linux_amd64.tar.gz"
      sha256 "dde08de0c0a7966da7105ed3b9c01c94495e1fe00264699fed797f5f59d36b30"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260824084502", output
  end
end
