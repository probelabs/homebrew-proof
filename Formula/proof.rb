class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260801194157"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260801194157/proof_0.1.0-main.20260801194157_darwin_arm64.tar.gz"
      sha256 "bfc68004229702d1fe3d04be226410be3e32e2af74544b4f5b6104c9b0f5a749"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260801194157/proof_0.1.0-main.20260801194157_darwin_amd64.tar.gz"
      sha256 "8829d300f7fc9e56508c21e592acee40d2d2d64a1ee4d945afec3332aece8619"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260801194157/proof_0.1.0-main.20260801194157_linux_arm64.tar.gz"
      sha256 "20ca92cb8cfd678f5c9f422839c90b54bc0fae0dc4654fd4f2e7e8d7af9dcf0a"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260801194157/proof_0.1.0-main.20260801194157_linux_amd64.tar.gz"
      sha256 "ac07a2aa63680df2012a799a8eb85c1151da9418265d3d1518c9c49d7103bcbe"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260801194157", output
  end
end
