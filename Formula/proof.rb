class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260730100353"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260730100353/proof_0.1.0-main.20260730100353_darwin_arm64.tar.gz"
      sha256 "34dea87da6f4dfabca4981fc8ce4e7f0e5152efc95e868d7286d39087d394694"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260730100353/proof_0.1.0-main.20260730100353_darwin_amd64.tar.gz"
      sha256 "75e72450cc64a13478a429d1f4978c2cda6c6eeacb371938c6cfe104c5466dc4"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260730100353/proof_0.1.0-main.20260730100353_linux_arm64.tar.gz"
      sha256 "ec23a7fa3a32ee5b2c758bdf2192a6abf8be2157f204e84b0967e92e16903f8c"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260730100353/proof_0.1.0-main.20260730100353_linux_amd64.tar.gz"
      sha256 "c62047d23bb6fe24b7df7d7121888a1e0727611d035ff8cd9d9f2ae2df1a7f47"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260730100353", output
  end
end
