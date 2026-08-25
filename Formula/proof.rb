class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1/proof_0.1_darwin_arm64.tar.gz"
      sha256 "34525f4aee6e13cdcaa75c263a60d31a5ef65bad5d00006981e458d0d1e85d83"
    else
      url "https://downloads.reqproof.com/releases/0.1/proof_0.1_darwin_amd64.tar.gz"
      sha256 "7aaff9b8a9a5714dc614fd770ec5aa77eb2e9d050287788819b6999d4da7f28c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1/proof_0.1_linux_arm64.tar.gz"
      sha256 "bcda9edcc2533e76bf3e2fe750973bbd63151fe78de61b1df61a943a51c329db"
    else
      url "https://downloads.reqproof.com/releases/0.1/proof_0.1_linux_amd64.tar.gz"
      sha256 "d675a1ef4c0480824a12dc82c958adb9b81e14ffa9e9f3d0ccb7acaf78bd5894"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1", output
  end
end
